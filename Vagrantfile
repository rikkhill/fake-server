Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"
  config.vm.host_name = "dbserver"
  config.vm.synced_folder "server_setup", "/srv/setup"
  config.vm.provision "shell", inline: "/srv/setup/setup.sh"
  config.vm.network "forwarded_port", guest: 5432, host: 55432
end
