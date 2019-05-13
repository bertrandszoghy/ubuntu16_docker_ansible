#!/bin/bash
# bertrand szoghy 
# Using Vagrant, set up a Linux Ubuntu 16 VM from scratch for Docker, Ansible, Python, etc
# last modified 2019-05-10

echo " "
echo "***"
echo "Installing some basic utilities" 
echo "***"
echo " "
sudo apt-get install -y build-essential software-properties-common python3 python-boto make cmake curl git ruby autoconf automake gettext libtool flex bison libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev unzip g++ apt-transport-https ca-certificates
echo " "
echo "***"
echo "Installing docker"
echo "***"
echo " "
# Update system
sudo apt-get update -qq

# Prep apt-get for docker install
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add docker repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update system
sudo apt-get update -qq

#apt-get install -y docker-ce=17.06.2~ce~0~ubuntu  # in case we need to set the version
sudo apt-get install -y docker-ce
echo " "
echo "***"
echo "Install docker-compose"
echo "***"
echo " "
sudo curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /home/vagrant/docker-compose
sudo mv /home/vagrant/docker-compose /usr/local/bin/docker-compose
sudo chmod 777 /usr/local/bin/docker-compose
sudo usermod -a -G docker ubuntu # Add ubuntu user to the docker group
echo " "
echo "***"
echo "Testing docker"
echo "***"
sudo docker run --rm busybox echo All good
echo "***"
echo " "
echo "installing ansible"
echo "***"
echo " "
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible 
echo " "
echo "***"
echo "Update the system to the latest releases"
echo "***"
echo " "
sudo apt-get update
sudo apt-get upgrade -y
echo " "
echo "***"
echo "BUILD SUCCESSFUL, restarting"
echo "***"

sudo reboot
echo "***"
echo "Done"
echo "***"
