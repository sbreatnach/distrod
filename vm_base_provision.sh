#!/bin/bash
apt-get update
apt-get -q -y install python virtualbox-guest-dkms virtualbox-guest-x11
echo "127.0.0.1 ubuntu-xenial" >> /etc/hosts