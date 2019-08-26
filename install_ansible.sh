#!/bin/bash

mkdir -p ~/.ssh
chmod 700 ~/.ssh
cat /vagrant/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
cat /vagrant/.ssh/id_rsa > ~/.ssh/id_rsa
chmod 600 ~/.ssh/authorized_keys ~/.ssh/id_rsa

yum -y update

yum -y install epel-release 
yum -y install wget tree htop vim git tmux
yum -y install python python-pip python-devel sshpass python2-jmespath 
pip install setuptools cryptography --upgrade

pip install ansible
ansible-galaxy install --force -r ansible/requirements.yml

#selinuxoff
sed -i 's/.*SELINUX=enforcing.*/SELINUX=disabled/' /etc/selinux/config

cp .tmux.conf ~/