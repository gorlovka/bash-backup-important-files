# Bash - Backup important files
Simple scripts for making backups of only necessary files from your provided list.
There are two kind of files which are to be backed up:
Ones that need to be backed up often are in list_files_hidden.txt.
Another ones which don't need often back up or too big for that are in list_files.txt

Hot syncing happens over rsync using  SSH.
Cold syncing over rsync using local filesystem.

**Cold backup** - you insert sometimes the disk for syncing and then detach it from network altogether and keep it in the secret place. The file for this case is **backup_cold.sh**

**Hot backup** - to be run from crontab on regular basis you prefer. The files responsible for this are **backup_hot_over_proxy.sh and backup_hot.sh**. As you might have guessed the one with _over_prefix ending is used to send back up data to machine which is behind NAT.  For machine which has public available IP **backup_hot.sh** is to be used.

**Usage:**
1. Do cp .env.example .env
2. Set you paths
3. Adapt list_files.txt for your needs. All routes are related to HOME directory.
4. Usage command example: 
`bash backup_cold.sh list_files.txt DISK_NAME_MOUNTED_INTO_MEDIA_FOLDER`
5. Or `bash backup_cold.sh list_files_hidden.txt DISK_NAME_MOUNTED_INTO_MEDIA_FOLDER`

list_files.txt and list_files_hidden.txt should contain only one newline in the end.
Feel free to adapt the content of these files for your needs.
