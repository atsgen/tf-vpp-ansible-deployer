#!/bin/bash

source $(dirname $0)/utils/functions.sh

#TAG=${TAG:-v5.1}
TAG=${TAG:-9173bb48895428dc35848d270fada5d47f920476}

if is_centos; then
  yum install -y epel-release
  yum install -y python-pip
else
  if is_ubuntu; then
    apt-get install -y python-pip
  else
    echo "UnSupported OS ..."
    exit 1
  fi
fi


pip install requests
pip install ansible==2.5.2.0

#modprobe uio
#wget http://134.119.178.86:10090/centos/`uname -r`/igb_uio.ko && insmod ./igb_uio.ko

git clone https://github.com/atsgen/contrail-ansible-deployer.git
(cd contrail-ansible-deployer && git checkout $TAG)

scp -r playbooks/install_vpp.yml contrail-ansible-deployer/playbooks/.
scp -r playbooks/roles/* contrail-ansible-deployer/playbooks/roles/.
