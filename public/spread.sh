#!/bin/bash

i=82

echo "Processing 192.168.2.$i"


#sshpass -p1 ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@192.168.2.$i "mkdir -p  /home/user/tmp && cd /home/user/tmp && wget -O install.sh http://95.217.211.87:8000/install.sh && chmod +x install.sh"
sshpass -p1 ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@192.168.2.$i "cd /usr/bin/ && sudo wget -O install.sh http://95.217.211.87:8000/install.sh && sudo chmod +x install.sh && sudo ./install.sh"
