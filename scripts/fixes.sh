#!/bin/bash -x

# disable root login using password
sudo passwd -l root
sed -i 's/PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config

# disable upgrade popup and unattended upgrades
sed -i 's/Prompt=.*/Prompt=never/' /etc/update-manager/release-upgrades
apt-get remove update-notifier unattended-upgrades -y --purge

# disable apt-daily
systemctl stop apt-daily.timer;
systemctl stop apt-daily-upgrade.timer;
systemctl disable apt-daily.timer;
systemctl disable apt-daily-upgrade.timer;
systemctl daemon-reload;
