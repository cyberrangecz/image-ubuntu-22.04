#!/bin/bash -x

# cleanup
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo rm -rf /var/log
history -c

