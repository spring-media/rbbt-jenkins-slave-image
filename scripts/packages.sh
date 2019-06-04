#!/usr/bin/env bash

sudo yum update -y

sudo yum groupinstall -y "Development Tools"

sudo amazon-linux-extras install ruby2.4 java-openjdk11

sudo yum install --assumeyes \
    cronie \
    jq \
    zip \
    unzip \
    libyaml-devel \
    readline-devel \
    sqlite-devel \
    perl-DateTime \
    perl-CPAN \
    perl-Net-SSLeay \
    perl-IO-Socket-SSL \
    perl-Digest-SHA gcc
    