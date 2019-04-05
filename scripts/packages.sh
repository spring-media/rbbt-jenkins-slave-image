#!/usr/bin/env bash

sudo yum update -y

sudo yum groupinstall -y "Development Tools"

sudo yum install --assumeyes \
    java-1.8.0-openjdk-devel \
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
    