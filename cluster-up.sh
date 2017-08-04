#!/bin/bash

##Create infrastructure and inventory file
echo "Creating infrastructure"
cd kubespray
vagrant up
create_inventory_file.sh
##Run Ansible playbooks
echo "Quick sleep while instances spin up"
sleep 120
echo "Ansible provisioning"
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i kubespray/inventory/inventory -u vagrant -b kubespray/cluster.yml
