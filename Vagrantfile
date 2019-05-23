# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "file://output-virtualbox-ovf/centos-7-virtualbox.box"
  config.vm.provision "shell", inline: "date"
end
