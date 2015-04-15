# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
end
