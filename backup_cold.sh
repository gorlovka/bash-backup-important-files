#!/bin/bash
#EXAMPLE TO RUN

#  bash backup_cold1.sh list_files_hidden.txt
#  bash backup_cold1.sh list_files.txt

# !!!! Beware of extra new lines in files, only ONE is needed

# Example how to run
# bash backup_cold.sh list_files_hidden.txt 2tb && bash backup_cold.sh list_files.txt 2tb

source  .env

DISK_DESTINATION_NAME=/media/`whoami`/$2

# destination folder
COLD_DISK_FOLDER=$DISK_DESTINATION_NAME/`date +%Y-%m-%d`

SOURCE_FILES_LIST=$1

echo $COLD_DISK_FOLDER

read -p "Backup will be made to dir $COLD_DISK_FOLDER . Are you sure? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Cancelled"
    exit
fi

echo "Started"



cat $SOURCE_FILES_LIST

mkdir $COLD_DISK_FOLDER || true > /dev/null

cat $SOURCE_FILES_LIST | while read entity; do
  FILENAME=$ROOT_FOLDER/$entity;
  echo $FILENAME 
  rsync -v -u -a -L -r -p  --stats    $FILENAME $COLD_DISK_FOLDER/  
done
