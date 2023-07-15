#!/usr/bin/env bash
# check the first 1000 standard UIDs for any existing new users
eval echo {1000..2000} | xargs -n1 getent passwd | cut -d: -f1
