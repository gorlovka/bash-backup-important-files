#!/bin/bash
#EXAMPLE TO RUN

#  bash backup_cold1.sh list_files_hidden.txt
#  bash backup_cold1.sh list_files.txt

#  bash backup_cold2.sh list_files_hidden.txt
#  bash backup_cold2.sh list_files.txt


source  .env

# destination folder
COLD_DISK_FOLDER=$COLD_DISK1/`date +%Y-%m-%d`

SOURCE_FILE=$1


mkdir $COLD_DISK_FOLDER || true > /dev/null

cat $SOURCE_FILE | while read entity; do 
  FILENAME=$ROOT_FOLDER/$entity;
  echo $FILENAME 
  rsync -v -u -a -L -r  --stats    $FILENAME $COLD_DISK_FOLDER/  
done
