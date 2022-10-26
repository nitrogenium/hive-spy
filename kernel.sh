#!/bin/bash

start_ssh_rig_id=$(curl -G --data-urlencode "n=qwe"  "http://127.0.0.1:8000/report")

if [ "$start_ssh_rig_id" -gt 0 ]
then
    hssh_output=$(cat test.txt)
    curl --data "hssh=$hssh_output" "http://127.0.0.1:8000/hssh/$start_ssh_rig_id"
fi
