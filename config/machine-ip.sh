#!/bin/bash
ip=`ip address | grep ens33 | grep inet | awk '{print $2}' | awk -F'/' '{print $1}'`
cp ./swarm/default.env ./swarm/.env
sed -i "s:{MACHINEIP}:$ip:" ./swarm/.env
cp ./config/gogs.app.ini ./config/.gogs.app.ini
sed -i "s:MACHINEIP:$ip:" ./config/.gogs.app.ini
echo "$ip basic" >> /etc/hosts
