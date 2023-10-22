#!/bin/bash
#EXAMPLE TO RUN
#  bash backup_cold.sh list_files.txt
#  bash backup_cold.sh list_files_hidden.txt

source  .env

# destination folder
COLD_DISK_FOLDER=$COLD_DISK2/`date +%Y-%m-%d`

SOURCE_FILE=$1


mkdir $COLD_DISK_FOLDER || true > /dev/null

cat $SOURCE_FILE | while read entity; do 
  FILENAME=$ROOT_FOLDER/$entity;
  echo $FILENAME 
  rsync -v -u -a -L -r  --stats    $FILENAME $COLD_DISK_FOLDER/  
done
