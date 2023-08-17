#!/bin/bash
#add fix to exercise5-server1 here

ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa
sudo apt install sshpass
sshpass -p vagrant ssh-copy-id vagrant@server2
