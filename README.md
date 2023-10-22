# bash-backup-important-files
Simple scripts for making backups of only necessary files from your provided list.
Adapt to your needs.

Syncing happens over SSH.

Hot backup - to be run from crontab on regular basis you prefer. 

Cold backup - you insert sometimes the disk for syncring and then detach it from network altogether and keep it under the pillow.

Usage:
1. Do cp .env.example .env
2. Set you paths
3. Adapt list_files.txt for your needs. All routes are related to HOME directory.
4. Run either bash backup_cold.sh  or bash backup_cold.sh


Or
bash backup_cold_full.sh to both disks
