#!/bin/bash

#EXAMPLE TO RUN
#  bash backup_hot.sh list_files.txt
#  bash backup_hot.sh list_files_hidden.txt

#  bash backup_hot.sh list_files.txt &&  bash backup_hot.sh list_files_hidden.txt

# bash backup_hot_over_proxy.sh list_files.txt /home/sh/hddbi/backup_crucial_to_point1
source  .env

HOT_DISK=$2
# destination folder
HOT_DISK_FOLDER=$HOT_DISK/`date +%Y-%m-%d`

SOURCE_FILE=$1


cat $SOURCE_FILE | while read entity; do
  FILENAME=$ROOT_FOLDER/$entity;
  echo $FILENAME 
#  echo rsync -v -u -a -L -r --mkpath   --stats  -e "ssh -p $HOT_PORT"   $FILENAME $HOT_ADDRESS:$HOT_DISK_FOLDER/
 rsync -v -u -a -L -r --mkpath  --stats -e "ssh -p 8192 -o ProxyCommand='ssh -p 8192 $HOT_ADDRESS nc 127.0.0.1 2221'" $FILENAME root@127.0.0.1:$HOT_DISK_FOLDER
done