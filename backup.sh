#!/bin/bash

# BackFile Backup Script
# Create a Bash script that makes a backup of a specific file. If the backup already exists, the script should append a timestamp to the backup's filename to avoid overwriting previous backups.


#Function for welcome screen
display_welcome_banner() {
    echo "---------------------------------"
    echo "Welcome to WarCrew BackUp Tool"
    cat << "EOF"
//////////////////////////////////////////////////////////
    __          __         _____                   
    \ \        / /        / ____|                  
     \ \  /\  / /_ _ _ __| |     _ __ _____      __
      \ \/  \/ / _` | '__| |    | '__/ _ \ \ /\ / /
       \  /\  / (_| | |  | |____| | |  __/\ V  V / 
        \/  \/ \__,_|_|   \_____|_|  \___| \_/\_/ 
        
/////////////////////////////////////////////////////////

EOF
}

#Function for errors
handle_error() {
    local error_message="$1"
    echo "Something went wrong: $error_message"
}

#Function to get backup path
backup_files() {
    read -p "Enter the path for the backup:(Empty for basic defualt backup paths)" what_to_backup

    #Checking if Empty for defulat path
    if [ -z "$what_to_backup" ]; then
        default_backup_path="/home /var/spool/mail /etc /root /boot /opt"
        echo "Using backup paths: $default_backup_path"
        what_to_backup="$default_backup_path"
    fi
}

#Function for the dest path
dest_backup_path() {
    read -p "Enter the path for destination backup" dest_backup
    if [ -z "$dest_backup" ]; then
    default_dest_backup_path="/mnt/backup"
    echo "Using backup dest path: $default_dest_backup_path"
    dest_backup="$default_dest_backup_path"
    fi
}

#Function to generate timestamp including day,full date and the final file name with .tgz ending
timestamp() {
date_file=$(date "+%A-%d-%m-%Y")
hostname_file=$(hostname -s)
archive_file="$date_file-$hostname_file.tgz"
}

#Function to backup
tar_backup() {
    echo "Backing up $what_to_backup to $dest_backup/$archive_file"
    echo "---------------------------------"
    tar czf $dest_backup/$archive_file $what_to_backup

    #Checking if the exit code of tar command equals to 0, if not the backup faild
    if [ $? -ne 0 ]; then
        handle_error "Backup failed"
        exit 1
    fi

    echo "Backup finished without errores."
    date
}

goodbye() {
	echo "Thank you for using WarCrew Backup Tool."

	cat << "EOF"
//////////////////////////////////////////////////
____               ____             
| __ ) _   _  ___  | __ ) _   _  ___ 
|  _ \| | | |/ _ \ |  _ \| | | |/ _ \
| |_) | |_| |  __/ | |_) | |_| |  __/
|____/ \__, |\___| |____/ \__, |\___|
       |___/              |___/      
EOF

	read -n 1 -s -r -p "Press any key to exit..."
    echo
	return 0
}

display_welcome_banner
backup_files
dest_backup_path
timestamp
tar_backup
goodbye
