#!/bin/bash
set -ex

sudo rm -f /var/lib/mysql/mysqld-slow.log
sudo rm -f /var/log/nginx/isucon5.access_log.tsv /var/log/nginx/access.log
sudo rm -fr /tmp/nytprof.out.* /tmp/nytprof_report

# sudo supervisorctl stop isucon_perl # for nytprof
# sudo systemctl restart isuxi.perl
