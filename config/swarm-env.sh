#!/bin/bash
registry="stoneagle/develop"
uid=`id -u`
uname=`id -un`
sed -i "s:{REGISTRY}:$registry:" ./swarm/.env
sed -i "s:{DEVUID}:$uid:" ./swarm/.env
sed -i "s:{DEVUSER}:$uname:" ./swarm/.env
