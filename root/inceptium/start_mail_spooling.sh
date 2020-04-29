#!/bin/bash
LOGFILE=/root/inceptium/log/letoservice.log
FILE="/root/inceptium/etc/mail/spool"
MOMTO=""
GIRO=1
while [ $GIRO -eq 1 ]
do
	for f in $FILE/*.spool;
	do
   		MOMTO=`cat $f | grep "To:"`
		msg=$?
		if [ $msg -eq 0 ]; then
			#echo "Messaggio > $msg"
			mo=${MOMTO:0:3}
			#echo $mo
			if [ $mo = "To:" ]; then
				echo "InceptiumService SH: spooling file -> $f " >> $LOGFILE
	   			MOMTO=${MOMTO:3}
   				echo "InceptiumService SH: Send Mail to -> $MOMTO" >> $LOGFILE
   				ssmtp $MOMTO < $f
			fi
			rm $f
		fi
		sleep 1
	done
	sleep 10
done
