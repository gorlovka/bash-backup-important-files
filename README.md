# bash-backup-important-files
Simple scripts for making backups of only necessary files from your provided list.
Adapt to your needs.

Hot syncing happens over rsync using  SSH.
Cold syncing over rsync using local filesystem.

Hot backup - to be run from crontab on regular basis you prefer. 

Cold backup - you insert sometimes the disk for syncing and then detach it from network altogether and keep it in the secret place.

Usage:
1. Do cp .env.example .env
2. Set you paths
3. Adapt list_files.txt for your needs. All routes are related to HOME directory.
4. Usage command example: 
`bash backup_cold.sh list_files.txt DISK_NAME_MOUNTED_INTO_MEDIA_FOLDER`
5. Or `bash backup_cold.sh list_files_hidden.txt DISK_NAME_MOUNTED_INTO_MEDIA_FOLDER`

list_files.txt and list_files_hidden.txt should contain only one newline in the end.
Feel free to adapt the content of these files for your needs.
