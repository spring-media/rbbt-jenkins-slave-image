#!/usr/bin/env bash

#set time zone to Dublin
sudo sed -i 's/\(ZONE="\)\(.*\)\("\)/\1Europe\/Dublin\3/g' /etc/sysconfig/clock
sudo ln -sf /usr/share/zoneinfo/Europe/Dublin /etc/localtime
date

#ulimit
sudo bash -c "cat <<EOF >> /etc/security/limits.conf 
*                hard    nofile         50000
*                soft    nofile         50000
EOF"

# cron
sudo systemctl status crond.service

sudo curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O

sudo unzip CloudWatchMonitoringScripts-1.2.2.zip -d /opt \
    && sudo rm CloudWatchMonitoringScripts-1.2.2.zip

sudo touch /var/log/docker-clean.log
chown root:jenkins /var/log/docker-clean.log
chmod 0555 /var/log/docker-clean.log

sudo crontab -l | { cat; echo "0 6 * * * /usr/bin/cleanup_docker.sh > /var/log/docker-clean.log 2>&1"; } | crontab -
sudo crontab -l | { cat; echo "*/5 * * * * /opt/aws-scripts-mon/mon-put-instance-data.pl --mem-util --disk-space-util --disk-path=/ --from-cron"; } | crontab -
