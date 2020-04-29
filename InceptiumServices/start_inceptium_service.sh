#!/bin/bash
cd /root/InceptiumLinuxAppliance/InceptiumServices/
INCEPTIUM_ACTIVE=1
LOGFILE=/root/InceptiumLinuxAppliance/log/inceptium_srv.log
MSG=0
RESTARTCOUNT=0
while [ $INCEPTIUM_ACTIVE -eq 1 ];
do

	java -Xms128m -Xmx256m -cp "InceptiumServices.jar:/root/InceptiumLinuxAppliance/InceptiumServices/lib/*:/root/InceptiumLinuxAppliance/InceptiumServices/InceptiumApp/*" inceptiumserver.core.server.IncServer noswing updatedatabase landevice=eth0 >> $LOGFILE 2>&1
        MSG=$?
        echo "Messaggio ricevuto: $MSG" >>  $LOGFILE
        echo "MSG: $MSG" >> $LOGFILE
        RESTARTCOUNT=`expr $RESTARTCOUNT + 1`
        echo "RESTARTCOUNT: $RESTARTCOUNT" >> $LOGFILE
        sleep 15
        echo "SLEPT" >> $LOGFILE
        if [ $MSG -eq 100 ];
        then
                INCEPTIUM_ACTIVE=1
                echo "[$MSG] InceptiumServices stopped!!!" >> $LOGFILE
                RESTARTCOUNT=0
		#shutdown -hP now
        fi
        if [ $RESTARTCOUNT -ge 30 ];
        then
                INCEPTIUM_ACTIVE=0
                echo "InceptiumSrv e' stato bloccato in seguito a 30 tentativi automatici di riavvio." >> $LOGFILE
		echo "Send Mail service Stop!!!"
		#ssmtp cpmatrix@mac.com < mail-stop.txt
		reboot
        fi
	echo "Send Mail Service Restart"
	#ssmtp cpmatrix@mac.com < mail-riavvio.txt
done
echo "Voluntary Kill at `date`" >> $LOGFILE
exit

