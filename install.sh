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
#apt-get install vagrant -y
vagrant -v
echo " "
echo " "

#sleep 5

echo "Iniciando a instalação do ansible"
#apt-get install ansible -y
echo " "
echo " "

ansible --version

sleep 5

echo "Inciando o vagrant"
echo " "
echo " "

vagrant init

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

sleep 02

echo "Você escolheu a interface $INTERFACE"
echo " "
echo " "

sleep 2
INTERFACE_IP=$(ifconfig wlp5s0 | grep broadcast | cut -d "t" -f2 | cut -d " " -f2)

echo "Precisamos configurar 02 máquinas com os IP's na mesma rede da sua máquina que é:$INTERFACE_IP"

sleep 3

echo " "
echo " "

read -p "IP da máquina WORDPRESS: " -t 20 IP_WORDPRESS
echo " "
read -p "IP da máquina MYSQL: " -t 20 IP_MYSQL
echo " "
echo " "

echo "IP da máquina wordpress $IP_WORDPRESS"
echo "IP da máquina MYSQL $IP_MYSQL"

echo " "
echo " "
echo "Iniciando o box Wordpress"
sleep 2
echo " "
echo " "
cp vagrantfileTemplate Vagrantfile

sed -ie 's/vars_ip_addr1/'$IP_WORDPRESS'/' Vagrantfile
sed -ie 's/vars_ip_addr2/'$IP_MYSQL'/' Vagrantfile

sed -ie 's/vars_ip_addr1/'$IP_WORDPRESS'/' hosts
sed -ie 's/vars_ip_addr2/'$IP_MYSQL'/' hosts

sed -ie 's/vars_ip_addr1/'$IP_WORDPRESS'/' group_vars/all.yml
sed -ie 's/vars_ip_addr2/'$IP_MYSQL'/' group_vars/all.yml

echo "Deploy BOX WORDPRESS"
vagrant up wordpress
sleep 2
echo " "
echo " "

echo "Deploy BOX MYSQL"
vagrant up mysql
echo " "
echo " "

vagrant status

echo " "
echo " "

echo "Iniciando as configurações com ansible..."
sleep 15
ansible-playbook provisioning.yml -i hosts

echo " "
echo " "

echo "SE AS CONFIGURAÇÕES DO ANSIBLE DERAM ERRO É PORQUE CERTAMENTE A SUA MÁQUINA NÃO CONSEGUIU FAZER A TROCA DE CHAVES COM OS BOXES NA PRIMEIRA TENTATIVA."
echo "PARA CONTORNAR ISSO, BASTA RODAR O PLAYBOOK DO ANSIBLE MANUALMENTE COM O SEGUINTE COMANDO:"
echo "ansible-playbook provisioning.yml -i hosts"
echo " "
echo " "
echo "Acesse sua página em: http://$IP_WORDPRESS"
