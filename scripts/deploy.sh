#!/bin/bash
set -ex
IPADDR=$1
ssh isucon@$IPADDR "cd /home/isucon/deploy && git pull && ~/deploy/env.sh carton install && sudo systemctl restart isuxi.perl"
