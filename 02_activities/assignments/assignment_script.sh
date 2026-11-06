# first section of scripts are given
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
cd ./data/raw

# step 4
cd .. 
mkdir processed 
cd processed
mkdir server_logs user_logs event_logs

#step 5
cd ..
cd raw 
cp server*.log ../processed/server_logs # or: cp server*.log ~/newproject/data/processed/server_logs/

#step 6
cp user*.log ../processed/user_logs
cp event*.log ../processed/event_logs

#step 7
rm *ipaddr*.*
cd ../processed/user_logs
rm *ipaddr*.log

#step 8
ls >> ~/git/newproject/data/inventory.txt
cd ..
cd event_logs
ls >> ~/git/newproject/data/inventory.txt
cd ..
cd server_logs
ls >> ~/git/newproject/data/inventory.txt

echo "Project setup is complete!"
