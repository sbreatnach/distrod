#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive

# update timezone from injected configuration
dpkg-reconfigure --frontend noninteractive tzdata

# install base packages
apt update && apt remove -y rsyslog && apt install -y gnupg pulseaudio
