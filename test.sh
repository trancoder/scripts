#!/bin/bash

# Prompt the user for password
echo -n "Enter password for remote server: "
read -s password
echo

# Define the source and destination paths
source_path="user@192.168.10.129:/path/to/source"
destination_path="/path/to/destination"

# Run rsync with the provided password
echo "Transferring data..."
rsync -avz --progress --delete --exclude-from=/path/to/exclude.txt -e "sshpass -p '$password' ssh -o StrictHostKeyChecking=no" "$source_path" "$destination_path"

# Check if rsync was successful
if [ $? -eq 0 ]; then
  echo "Data transfer completed successfully."
else
  echo "Data transfer failed. Please check your inputs and try again."
fi
