#!/usr/bin/env bash

curl -sL https://rpm.nodesource.com/setup_11.x | sudo -E bash -
sudo yum install -y nodejs npm yarn

sudo mkdir -m0777 /var/spool/npm_cache

#change global directory location
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
sudo install -d -o jenkins -g jenkins -m 0777 /var/lib/jenkins/.npm-global

sudo bash -c "cat <<EOF > /etc/profile.d/npm_global_path.sh
export PATH=~/.npm-global/bin:$PATH
/usr/bin/npm config set cache /var/spool/npm_cache
/usr/bin/npm config set prefix ~/.npm-global
EOF"

sudo chmod 0755 /etc/profile.d/npm_global_path.sh
