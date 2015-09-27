#!/bin/bash
set -ex
IPADDR=$1
USERNAME=$USER
ssh isucon@$IPADDR "/home/isucon/notify.sh $USERNAME 'deploying...' && cd /home/isucon/deploy && git pull && ~/deploy/env.sh carton install && sudo systemctl restart mysql && sudo systemctl restart isuxi.perl && sudo systemctl restart nginx && sudo sysctl -p && /home/isucon/notify.sh $USERNAME 'deploy done'"
