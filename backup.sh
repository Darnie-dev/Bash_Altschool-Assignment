#!/bin/bash

# check for the  number of arguments = 2 
if [ $# -ne 2 ]
then
	echo "expected number of arguments is incomplete"
	echo "$0 <source_directory> <destination_directory>"
	exit 1
fi

source_dir=$1
destination_dir=$2

# check if source source directory exists
if [ ! -d "$source_dir" ]
then
	echo "error: source directory '$source_dir' not found"
	exit 1
fi

# check for destination directory exist, if not,  create it
if [ ! -d "$destination_dir" ]
then
	mkdir -p "$destination_dir"
fi

# create a tar archive with a timestamp
timestamp=$(date +%d-%m-%Y_%H:%M)

backup_file="$destination_dir/backup_$timestamp.tar.gz"

# perform backup
tar -czvf "$backup_file" -C "$source_dir" .

echo "Backup completed. view $backup_file"
