#!/bin/bash
USERNAME="root"
PASSWORD="123456"
HOST="mysql"
GOGS="gogs"
DRONE="drone"
TIME="time"
ADMIN="admin"
QUANT="quant"
EVOLUTION="evolution"
######################
#crate database
mysql -u$USERNAME -p$PASSWORD -h$HOST << EOF
CREATE DATABASE IF NOT EXISTS $GOGS default charset utf8 COLLATE utf8_general_ci; 
CREATE DATABASE IF NOT EXISTS $DRONE default charset utf8 COLLATE utf8_general_ci; 
CREATE DATABASE IF NOT EXISTS $TIME default charset utf8 COLLATE utf8_general_ci; 
CREATE DATABASE IF NOT EXISTS $QUANT default charset utf8 COLLATE utf8_general_ci; 
CREATE DATABASE IF NOT EXISTS $TEST default charset utf8 COLLATE utf8_general_ci; 
EOF
######################
