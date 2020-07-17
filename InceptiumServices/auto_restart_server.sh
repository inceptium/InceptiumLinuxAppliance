#!/bin/bash

path="/root/IncStorage/InceptiumAppStore"
declare -a NOMEAPP #ogni elemento è nome.jar senza il percorso
declare -a NEWNOMEAPP #ogni elemento è nome.jar senza il percorso
declare -a HASHAPP #ogni elemento contiene l'hash del file senza il nome
declare -a NEWHASHAPP #ogni elemento contiene l'hash del file senza il nome

declare -A NOMEAPPHASHAPP #nomeapp -> hashapp
declare -A NEWNOMEAPPNEWHASHAPP #nomeapp -> hashapp

function init() {
    NUMELEM=`ls -lR $path/*.jar | wc -l`

    for file in $path/*.jar
    do
    : '
	NOMEAPP=("${NOMEAPP[@]}" "{file##*/}")
	tmp=$(sha512sum $file)
	HASHAPP=("${HASHAPP[@]}" "${tmp%% *}")
    '
    tmp=$(sha512sum $file)
    NOMEAPPHASHAPP["{file##*/}"]="${tmp%% *}"
    done
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
	: '
           NEWNOMEAPP=`ls $path/*.jar` #a che serve??
	   tmp=$(sha512sum $file)
           NEWHASHAPP=("${NEWHASHAPP[@]}" "${tmp%% *}")
	 '
	 tmp=$(sha512sum $file)
	 NEWNOMEAPPNEWHASHAPP["{file##*/}"]="${tmp%% *}"
	 
    	done
	
	: '
        for k in NUMELEM
        do
            if [${HASHAPP[k]} != ${NEWHASHAPP[k]}] 
            then
                restart
            fi
        done
	'
	for i in "${!NOMEAPPHASHAPP[@]}";
	do
	    if [ ${NOMEAPPHASHAPP[$i]} != ${NEWNOMEAPPNEWHASHAPP[$i]} ]
        then
	        restart
	    fi
	done
    fi
done

#fine script
