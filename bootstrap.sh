#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

cd ~
mkdir -p ~/.ssh
mkdir ansible_key
cd ansible_key
wget https://raw.githubusercontent.com/TheLastCicada/Ansible_Public_Key/master/id_rsa.pub
cd ~
cat ~/ansible_key/id_rsa.pub >> ~/.ssh/authorized_keys
chown -R root:root ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
