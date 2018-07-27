#!/bin/bash
ip=`ip address | grep ens33 | grep inet | awk '{print $2}' | awk -F'/' '{print $1}'`
echo "$ip basic" >> /etc/hosts
