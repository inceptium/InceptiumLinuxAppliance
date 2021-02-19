#!/bin/bash

# Define a timestamp function
# do something...
DB_NAME=$1
DB_HOST=$2
FileName=$DB_NAME
cd /root/backup_sql/
mkdir -p $DB_NAME
cd /root/backup_sql/$DB_NAME
find -type f -mtime  +10 -exec rm -f {} \; 
DataAttuale=$(date +%d%m%Y_%H%M)
mysqldump --host=$DB_HOST -u root -p*carolsql1 $DB_NAME  --skip-triggers > $FileName"_"$DataAttuale".sql"
zip $FileName"_"$DataAttuale".sql.zip" $FileName"_"$DataAttuale".sql"
rm $FileName"_"$DataAttuale".sql"
echo "Copia effettuata!!!"
