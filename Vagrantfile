# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

   config.vm.box = "centos/7"

   # Disable pushing updates to the box from people who have made this box 
   config.vm.box_check_update = false

   # Disable the default /vagrant share
   config.vm.synced_folder "../data", "/vagrant_data" , disabled: true

   config.vm.define "kb8s-master" do |cfg|
    cfg.vm.network "private_network", ip: "192.168.33.101"
    cfg.vm.hostname = "kb8s-master"
    cfg.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.name = 'kb8s-master'
     vb.memory = "1100"
    end
    cfg.vm.provision :ansible do |ansible|
     ansible.playbook = 'provision/master_provision.yml'
     ansible.inventory_path = 'vagrant-inventory.ini'
     ansible.limit = 'kb8s-master'
     ansible.verbose = 'v'
    end
   end
   config.vm.define "kb8s-node1" do |cfg|
    cfg.vm.network "private_network", ip: "192.168.33.102"
    cfg.vm.hostname = "kb8s-node1"
    cfg.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.name = 'kb8s-node1'
     vb.memory = "1100"
    end
    cfg.vm.provision :ansible do |ansible|
     ansible.playbook = 'provision/node1_provision.yml'
     ansible.inventory_path = 'vagrant-inventory.ini'
     ansible.limit = 'kb8s-node1'
     ansible.verbose = 'v'
    end
   end
   config.vm.define "kb8s-node2" do |cfg|
    cfg.vm.network "private_network", ip: "192.168.33.103"
    cfg.vm.hostname = "kb8s-node2"
    cfg.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.name = 'kb8s-node2'
     vb.memory = "1100"
    end
    cfg.vm.provision :ansible do |ansible|
     ansible.playbook = 'provision/node2_provision.yml'
     ansible.inventory_path = 'vagrant-inventory.ini'
     ansible.limit = 'kb8s-node2'
     ansible.verbose = 'v'
    end
   end
end

