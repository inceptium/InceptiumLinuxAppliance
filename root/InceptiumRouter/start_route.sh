#!/bin/bash
LOGFILE=/root/InceptiumRouter/router.log
#./route_ssh.sh 151.80.235.161 8081 192.168.10.71 8081 151.80.235.161 "LETO Ufficio" >> $LOGFILE &
#./route_ssh.sh 151.80.235.161 5555 127.0.0.1 22 151.80.235.161 "Accesso ssh container LXC debian" >> $LOGFILE &
cd /root/inceptium/InceptiumServices/
./start_inceptium_service.sh &

