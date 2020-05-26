#!/bin/bash
cd /root/InceptiumLinuxAppliance/InceptiumServices/
INCEPTIUM_ACTIVE=1
LOGFILE=/root/IncStorage/log/inceptium_srv.log
DATASTORAGE=/root/IncStorage
APPSTORE=/root/IncStorage/InceptiumAppStore
MSG=0
RESTARTCOUNT=0
rm $LOGFILE

	java -Xms128m -Xmx256m -cp "InceptiumServices.jar:/root/InceptiumLinuxAppliance/InceptiumServices/lib/*:/root/IncStorage/InceptiumAppStore/*" inceptiumserver.core.server.IncServer noswing updatedatabase install landevice=eth0 datastorage=$DATASTORAGE appstore=$APPSTORE 
