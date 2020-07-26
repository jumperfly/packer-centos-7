# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "file://boxes/centos-7-virtualbox.box"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "shell", inline: "date"
end
