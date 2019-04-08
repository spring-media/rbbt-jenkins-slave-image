#!/usr/bin/env bash

#jenkins system user
sudo useradd --create-home --home-dir /var/lib/jenkins \
    --shell /bin/bash \
    --uid '2000' \
    --comment 'Jenkins system user' \
    jenkins \

#ssh
sudo mkdir -m0700 /var/lib/jenkins/.ssh

#ssh keys
aws s3 cp s3://up-services-opsworks-eu-central-1/opsworks-config.tar.gz .
sudo tar zxvf opsworks-config.tar.gz \
    && sudo rm opsworks-config.tar.gz

sudo cp -a config/common/. /var/lib/jenkins/.ssh/
sudo cp -a config/jenkins/ssh/. /var/lib/jenkins/.ssh/

sudo chown -R jenkins:jenkins /var/lib/jenkins/
