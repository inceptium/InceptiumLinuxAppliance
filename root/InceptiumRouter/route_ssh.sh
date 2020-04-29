#!/bin/bash

IP_EXT_SERVER=$1
PORT_SERVER=$2
IP_LAN=$3
PORT_LAN=$4
IP_CNN=$5
LABEL=$6
while (true)
do
	echo $(date) "open tunnel for" $LABEL "-" $IP_EXT_SERVER:$PORT_SERVER:$IP_LAN:$PORT_LAN
	ssh -R $IP_EXT_SERVER:$PORT_SERVER:$IP_LAN:$PORT_LAN -N root@$IP_CNN -i incLCX -o ExitOnForwardFailure=yes -o ServerAliveInterval=15 >> router.log
	echo $(date) "close tunnel for" $LABEL
	sleep 10
	echo $(date) "retry connection for" $LABEL "..."
done
