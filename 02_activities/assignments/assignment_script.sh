# first section of scripts are given

#!/bin/bash
set -x

if [ -d newproject ]; then
  echo "Recreating the newproject directory"
  rm -rf newproject
fi
mkdir newproject
cd newproject

mkdir analysis output
touch README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip -q rawdata.zip

# this section of scripts are mine
# step 1
mkdir data

# step 2
mv ./rawdata ./data/raw

# step 3
ls ./data/raw

# step 4
mkdir ./data/processed 
mkdir ./data/processed/server_logs ./data/processed/user_logs ./data/processed/event_logs

#step 5
cp ./data/raw/server*.log ./data/processed/server_logs

#step 6
cp ./data/raw/user*.log ./data/processed/user_logs
cp ./data/raw/event*.log ./data/processed/event_logs

#step 7
rm ./data/raw/*ipaddr*.*
rm ./data/processed/user_logs/*ipaddr*.log

#step 8
ls ./data/processed/server_logs >> ./data/inventory.txt
ls ./data/processed/user_logs >> ./data/inventory.txt
ls ./data/processed/event_logs >> ./data/inventory.txt

echo "Project setup is complete!"
