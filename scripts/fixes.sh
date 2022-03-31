#!/bin/bash -x

# disable root login using password
sudo passwd -l root
DEBIAN_FRONTEND=noninteractive sudo apt-get install -y git apt-transport-https ca-certificates
