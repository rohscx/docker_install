#! /bin/bash

echo "Running apt-get"

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
echo "apt-get complete"  

echo "Running running curl for the Docker key and adding it with apt-key"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "Key grab complete"

echo "Adding Docker respository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "repository add complete"

echo "Running apt-get update"
sudo apt-get update
echo "update complete"

echo "Installing Docker from apt-get"
sudo apt-get install docker-ce
echo "install complete"

echo "Starting Docker service"
sudo service docker start
sudo docker inspect --format '{{.State.Status}} {{.NetworkSettings.IPAddress}} {{.Config.Labels.name}} {{.Config.Image}}' $(sudo docker ps -aq)
echo "Script complete"
