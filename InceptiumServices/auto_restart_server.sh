#!/bin/bash

path="/root/IncStorage/InceptiumAppStore"

declare -A OLD_HASH #nomeapp -> hashapp
declare -A NEW_HASH #nomeapp -> hashapp

function init() {
    NUMELEM=`ls -lR $path/*.jar | wc -l`
    echo $NUMELEM
    for file in $path/*.jar
    do
        codice=$(sha512sum $file)
	OLD_HASH[$file]=$codice
    done
    #echo ${OLD_HASH[@]}

}


function restart() {
    kill -9 `pgrep -f InceptiumServices.jar`
    init
}


#inizio script

init

while true; do
    sleep 5
	NEWNUMELEM=`ls -lR $path/*.jar | wc -l`

    if [ $NUMELEM -ne $NEWNUMELEM ]
    then
        restart
    else
    	for file in $path/*.jar
   	do
           codice=$(sha512sum $file)
           NEW_HASH[$file]=$codice
    	done

        for k in  $path/*.jar
        do
		if [[ ${NEW_HASH[$k]} != ${OLD_HASH[$k]} ]] 
        	then
		    echo "file $k modificato"
		    restart
            	fi
        done
    fi
done

#fine script
