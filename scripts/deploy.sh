#!/bin/bash
set -ex
IPADDR=$1
USERNAME=$USER
REVISION=${2:-`git log -n 1 --format='%h'`}
ssh isucon@$IPADDR "/home/isucon/notify.sh $USERNAME 'deploying...' && cd /home/isucon/deploy && git remote update && git checkout $REVISION && ~/deploy/env.sh carton install && sudo systemctl restart mysql && sudo service redis-server restart && sudo service memcached restart && sudo systemctl restart isuxi.perl && sudo systemctl restart nginx && sudo sysctl -p && /home/isucon/notify.sh $USERNAME 'deploy done'"
