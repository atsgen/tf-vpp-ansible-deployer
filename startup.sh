#!/bin/bash

TAG=${TAG:-v5.1}

git clone -b $TAG https://github.com/Juniper/contrail-ansible-deployer.git

scp -r playbooks/install_vpp.yml contrail-ansible-deployer/playbooks/.
scp -r playbooks/roles/* contrail-ansible-deployer/playbooks/roles/.
