#!/bin/bash

# Prompt the user for password
echo -n "Enter password for remote server: "
read -s password
echo

# Define the source and destination paths
source_path="lmuser@192.168.10.129:/home/lmuser/JointFire/JFAK-416/opt/ltsi-akit-3.1.1/var/log/AKit/Messages/AKit"
destination_path="/media/sf_shared/test"

# Run rsync with the provided password
echo "Transferring data..."
rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" lmuser@192.168.10.129:/home/lmuser/JointFire/JFAK-416/opt/ltsi-akit-3.1.1/var/log/AKit/Messages/AKit/* .

# Check if rsync was successful
if [ $? -eq 0 ]; then
  echo "Data transfer completed successfully."
else
  echo "Data transfer failed. Please check your inputs and try again."
fi
