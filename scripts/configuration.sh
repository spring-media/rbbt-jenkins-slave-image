#!/usr/bin/env bash

#set time zone to IST
sudo sed -i 's/\(ZONE="\)\(.*\)\("\)/\1Europe\/Dublin\3/g' /etc/sysconfig/clock
sudo ln -sf /usr/share/zoneinfo/Europe/Dublin /etc/localtime
date

#ulimit
for user in jenkins root
do
printf "%-7s \t hard \t nofile \t 50000\n" "$user" | sudo tee -a /etc/security/limits.conf
printf "%-7s \t soft \t nofile \t 50000\n" "$user" | sudo tee -a /etc/security/limits.conf
done

# cron
sudo curl https://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.2.zip -O

sudo unzip CloudWatchMonitoringScripts-1.2.2.zip -d /opt \
    && sudo rm CloudWatchMonitoringScripts-1.2.2.zip

sudo install -b -m 0555 -o root -g jenkins /dev/null /var/log/docker-clean.log
sudo install -m 0775 -o root -g jenkins /tmp/cleanup_docker.sh /usr/bin/cleanup_docker.sh
 
sudo crontab -l | { cat; echo "0 6 * * * /usr/bin/cleanup_docker.sh > /var/log/docker-clean.log 2>&1"; } | sudo crontab -
sudo crontab -l | { cat; echo "*/5 * * * * /opt/aws-scripts-mon/mon-put-instance-data.pl --mem-util --disk-space-util --disk-path=/ --from-cron"; } | sudo crontab -
