#!/bin/bash
#add fix to exercise5-server1 here

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd.service

sudo sed -i 's/#   StrictHostKeyChecking ask/    StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo -u vagrant ssh-keygen -q -t rsa -N '' -f /home/vagrant/.ssh/id_rsa
