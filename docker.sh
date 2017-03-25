#! /bin/bash

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
    
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
sudo apt-get install docker-ce

sudo service docker start
	if service is not running

sudo docker inspect --format '{{.State.Status}} {{.NetworkSettings.IPAddress}} {{.Config.Labels.name}} {{.Config.Image}}' $(sudo docker ps -aq)
