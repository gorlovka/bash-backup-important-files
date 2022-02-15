#!/bin/bash

#disk name
COLD_DISK=/media/sh/250

# destination folder
COLD_DISK_FOLDER=$COLD_DISK/`date +%Y-%m-%d`

# source folder for data
ROOT_FOLDER=/home/sh

mkdir $COLD_DISK_FOLDER || true > /dev/null

cat list_files_hidden.txt | while read entity; do 
  FILENAME=$ROOT_FOLDER/$entity;
  echo $FILENAME 
  rsync -rau -v  --ignore-existing   $FILENAME $COLD_DISK_FOLDER/  
done