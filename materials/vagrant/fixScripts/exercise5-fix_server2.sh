#!/bin/bash
#add fix to exercise5-server2 here

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd.service

sudo sed -i 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo -u vagrant ssh-keygen -q -t rsa -N '' -f /home/vagrant/.ssh/id_rsa
sudo apt-get update
sudo apt-get install sshpass
sshpass -p vagrant scp vagrant@192.168.60.10:/home/vagrant/.ssh/id_rsa.pub /home/vagrant/.ssh/
sudo cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
