-- Create user

CREATE USER test_db_user WITH PASSWORD 'test_db_pass';

-- Create test DB
CREATE DATABASE test_db WITH OWNER=test_db_user
                             LC_COLLATE='en_GB.utf8'
                             LC_CTYPE='en_GB.utf8'
                             ENCODING='UTF8'
                             TEMPLATE=template0;

