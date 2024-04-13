#!/bin/bash

#EXAMPLE TO RUN
#  bash backup_hot.sh list_files.txt
#  bash backup_hot.sh list_files_hidden.txt

#  bash backup_hot.sh list_files.txt &&  bash backup_hot.sh list_files_hidden.txt

source  .env

# destination folder
HOT_DISK_FOLDER=$HOT_DISK/`date +%Y-%m-%d`

SOURCE_FILE=$1


cat $SOURCE_FILE | while read entity; do 
  FILENAME=$ROOT_FOLDER/$entity;
  echo $FILENAME 
  echo rsync -v -u -a -L -r --mkpath   --stats  -e "ssh -p $HOT_PORT"   $FILENAME $HOT_ADDRESS:$HOT_DISK_FOLDER/
done