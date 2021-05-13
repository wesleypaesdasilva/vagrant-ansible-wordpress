#!/bin/bash

# Version: 1.2
# Date of create: 13/05/2021
# Create by: Wesley Paes
# Description: Vagrant + Ansible + Wordpress + MySql + Apache2

############# Chanding ##########
#
# Data of last change: 13/05/2021
# Changer by: Wesley Paes

## Install Vagrant and Ansible
echo "Iniciando a instalação do vagrant..."
apt-get install vagrant -y
vagrant -v

sleep 5

echo "Iniciando a instalação do ansible"
apt-get install ansible -y
ansible --version

sleep 5
