#!/bin/bash

# Check for the password argument
if [ -z "$1" ]; then
    echo "Please provide the MySQL root password as an argument."
    exit 1
fi

# Get current date for the archive name (day-month-year format)
current_date=$(date +'%d-%m-%Y')

# MySQL dump command
mysqldump -u root -p"$1" --all-databases > backup.sql

# Compress the dump to a tar.gz archive with the current date in the name
tar -czvf "$current_date.tar.gz" backup.sql

# Clean up: Remove the unneeded backup.sql file
rm backup.sql

echo "MySQL dump and compressed archive created for all databases."
