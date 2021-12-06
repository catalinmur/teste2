# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "box1" do |box1|
    box1.vm.box = "hashicorp/bionic64"
    box1.vm.hostname = "box1"
    box1.vm.network "private_network", ip: "192.168.56.101"
    box1.vm.provision "shell", path: "ssh_init_box1.sh"
  end
  config.vm.define "box2" do |box2|
    box2.vm.box = "hashicorp/bionic64"
    box2.vm.hostname = "box2"
    box2.vm.network "private_network", ip: "192.168.56.102"
    box2.vm.provision "shell",  path: "ssh_init_box2.sh"
  end
end
