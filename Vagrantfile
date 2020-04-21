# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.30"
  config.vm.synced_folder ".", "/vagrant",type:"virtualbox"
  
  config.vm.provider "virtualbox" do |vm|
    vm.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "docker"


   config.vm.provision "shell", inline: <<-SHELL
      #docker
      curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` > ~/docker-compose
      mv ~/docker-compose /usr/bin/docker-compose
      chown root:root /usr/bin/docker-compose
      chmod +x /usr/bin/docker-compose
      #クライアントツール用
      yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
      yum -y install postgresql10-server
    SHELL

   config.vm.provision "shell", run:"always",inline: <<-SHELL
        docker-compose -f /Application/docker-compose.yml up -d

   SHELL

   config.vm.synced_folder "./", "/Application", owner: "vagrant", group: "vagrant"

end
