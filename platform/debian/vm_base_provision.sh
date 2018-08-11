#!/bin/bash
apt-get update
apt-get -q -y install python virtualbox-guest-dkms virtualbox-guest-x11 apt-transport-https
echo "127.0.0.1 ubuntu-xenial ubuntu-bionic" >> /etc/hosts
