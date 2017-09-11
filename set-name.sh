#!/usr/bin/env bash
set -e

if [ $(whoami) != 'root' ]; then
 echo 'script must be run as root user'
 exit
fi

if [ -z $1 ]; then
 echo 'name parameter is required for updating LocalHostName, HostName and ComputerName'
 exit 1 
fi

NAME=$1

scutil --set LocalHostName $NAME
scutil --set HostName $NAME
scutil --set ComputerName $NAME
dscacheutil -flushcache

shutdown -r now

