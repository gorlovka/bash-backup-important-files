#!/bin/bash

source  .env

# destination folder
HOT_DISK_FOLDER=$HOT_DISK/`date +%Y-%m-%d`


cat list_files.txt | while read entity; do 
  FILENAME=$ROOT_FOLDER/$entity;
  echo $FILENAME 
  rsync -v -u -a -L -r --mkpath   --stats  -e "ssh -p $HOT_PORT"   $FILENAME $HOT_ADDRESS:$HOT_DISK_FOLDER/  
done