#!/bin/bash

source  .env

# destination folder
COLD_DISK_FOLDER=$COLD_DISK/`date +%Y-%m-%d`


mkdir $COLD_DISK_FOLDER || true > /dev/null

cat list_files.txt | while read entity; do 
  FILENAME=$ROOT_FOLDER/$entity;
  echo $FILENAME 
  rsync -v -u -a -L -r  --stats    $FILENAME $COLD_DISK_FOLDER/  
done