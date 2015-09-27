#!/bin/bash

exec /home/isucon/.local/perl/bin/carton exec start_server --path /dev/shm/app.sock --backlog 16384 -- plackup -s Gazelle --max-reqs-per-child 50000 -workers=4 -E prod app.psgi
