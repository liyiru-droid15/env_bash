#!/bin/bash
port=80
if [ $1 -gt 80 ];then
   port=$1
fi

#echo $port
firewall-cmd --zone=public --add-port=$port/tcp --permanent

firewall-cmd --reload

echo "port $port opened"
