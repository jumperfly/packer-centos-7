#!/bin/bash
vagrant destroy
if [[ -d "$HOME/.vagrant.d/boxes/file:-VAGRANTSLASH--VAGRANTSLASH-boxes-VAGRANTSLASH-centos-7-virtualbox.box" ]]; then
  vagrant box remove file://boxes/centos-7-virtualbox.box
fi
vagrant up
