#!/bin/bash

PG_VERSION=9.4
PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"

PG_REPO_APT_SOURCE=/etc/apt/sources.list.d/pgdg.list
if [ ! -f "$PG_REPO_APT_SOURCE" ]
then
  echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > "$PG_REPO_APT_SOURCE"

  wget --quiet -O - https://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
fi

apt-get update
apt-get -y install "postgresql-$PG_VERSION"

su - postgres -c "psql -f /srv/setup/db_setup.sql"

sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

echo "host    all             all             all                     md5" >> "$PG_HBA"

service postgresql restart
