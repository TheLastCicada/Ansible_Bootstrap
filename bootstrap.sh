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
cat ./id_rsa.pub >> ~/.ssh/authorized_keys
rm id_rsa.pub
wget https://gist.githubusercontent.com/TheLastCicada/b9008fe1c53f7d122af9/raw/7ccc41bc3898a37267c7ae1ddf83c2eaf177bfc5/id_rsa.pub
cat ./id_rsa.pub >> ~/.ssh/authorized_keys
rm id_rsa.pub
cd ~
chown -R root:root ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
rm -rf ~/ansible_key

