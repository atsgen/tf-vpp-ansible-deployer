#!/bin/bash

#TAG=${TAG:-v5.1}
TAG=${TAG:-9173bb48895428dc35848d270fada5d47f920476}

yum install -y wget epel-release

yum install -y python-pip

pip install requests
pip install ansible==2.5.2.0

modprobe uio
wget http://134.119.178.86:10090/centos/`uname -r`/igb_uio.ko && insmod ./igb_uio.ko

git clone https://github.com/atsgen/contrail-ansible-deployer.git
(cd contrail-ansible-deployer && git checkout tungsten-R5.1)

git clone https://github.com/atsgen/contrail-kolla-ansible.git
(cd contrail-kolla-ansible && git checkout e425109499170ac5fbcd0b83cb3b9829db1b1a77)

scp -r playbooks/install_vpp.yml contrail-ansible-deployer/playbooks/.
scp -r playbooks/roles/* contrail-ansible-deployer/playbooks/roles/.
