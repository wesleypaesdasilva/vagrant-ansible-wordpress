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
echo " "
echo " "
echo " "
echo " "
#apt-get install vagrant -y
vagrant -v
echo " "
echo " "
echo " "
echo " "

#sleep 5

echo "Iniciando a instalação do ansible"
#apt-get install ansible -y
echo " "
echo " "
echo " "
echo " "

ansible --version

sleep 5

echo "Inciando o vagrant"
echo " "
echo " "
echo " "
echo " "

#vagrant init

sleep 5

echo "Interfaces disponíveis para fazer a BRIDGE (MESMA REDE QUE A SUA MÁQUINA ESTÁ"
echo " "
echo " "

ifconfig | grep flags | cut -d ":" -f1

sleep 2

echo -e "Digite o nome da interface escolhida:"
read -p "Interface: " -t 20 INTERFACE 
echo " "
echo " "
echo " "
echo " "

sleep 02

echo "Você escolheu a interface $INTERFACE"
echo " "
echo " "
echo " "
echo " "

sleep 2
INTERFACE_IP=$(ifconfig wlp5s0 | grep broadcast | cut -d "t" -f2 | cut -d " " -f2)

echo "Precisamos configurar 02 máquinas com os IP's na mesma rede da sua máquina que é:$INTERFACE_IP"

sleep 3

echo " "
echo " "
echo " "

read -p "IP da máquina WORDPRESS: " -t 20 IP_WORDPRESS
echo " "
read -p "IP da máquina MYSQL: " -t 20 IP_MYSQL
echo " "



