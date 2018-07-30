#!/bin/bash
USERNAME="root"
PASSWORD="123456"
HOST="mysql"
GOGS="gogs"
DRONE="drone"
EVOLUTION="evolution"
######################
#crate database
mysql -u$USERNAME -p$PASSWORD -h$HOST << EOF
CREATE DATABASE IF NOT EXISTS $GOGS default charset utf8 COLLATE utf8_general_ci; 
CREATE DATABASE IF NOT EXISTS $DRONE default charset utf8 COLLATE utf8_general_ci; 
EOF
######################
