#!/bin/bash

yum install wget

wget https://npm.taobao.org/mirrors/node/v14.3.0/node-v14.3.0-linux-x64.tar.xz

xz -d node-v14.3.0-linux-x64.tar.xz

tar -xvf node-v14.3.0-linux-x64.tar

mv node-v14.3.0-linux-x64 /usr/local/node-v14.3.0

ln -s /usr/local/node-v14.3.0/bin/npm /usr/local/bin/npm
ln -s /usr/local/node-v14.3.0/bin/node /usr/local/bin/node

