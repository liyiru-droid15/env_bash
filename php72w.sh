#!/bin/bash

rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum install php72w php72w-cli php72w-bcmath php72w-pdo php72w-gd php72w-pecl-redis php72w-mbstring php72w-mcrypt -y
