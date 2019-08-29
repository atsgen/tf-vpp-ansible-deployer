#!/bin/bash

TAG=${TAG:-v5.1}

apt-get install -y wget epel-release python-pip ansible-2.4.2.0

wget http://134.119.178.86:10090/centos/3.10.0-862.3.2.el7.x86_64/igb_uio.ko
modprobe uio && insmod ./igb_uio.ko

git clone -b $TAG https://github.com/Juniper/contrail-ansible-deployer.git

scp -r playbooks/install_vpp.yml contrail-ansible-deployer/playbooks/.
scp -r playbooks/roles/* contrail-ansible-deployer/playbooks/roles/.
