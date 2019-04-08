#!/usr/bin/env bash

# installation
sudo amazon-linux-extras enable docker
sudo yum clean metadata 

sudo yum install -y python-pip epel-release \
    && sudo yum upgrade -y python*

sudo yum install -y docker docker-compose
sudo usermod -aG docker $(whoami)
sudo usermod -aG docker jenkins

# start Docker on boot
sudo systemctl enable docker.service
