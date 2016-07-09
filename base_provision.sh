#!/bin/bash
apt-get update
apt-get -q -y install python
echo "127.0.0.1 ubuntu-xenial" >> /etc/hosts