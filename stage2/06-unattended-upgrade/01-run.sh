#!/bin/bash -e

echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | debconf-set-selections
dpkg-reconfigure -f noninteractive unattended-upgrades

install -m 644 files/50unattended-upgrades "${ROOTFS_DIR}/etc/apt/apt.conf.d/50unattended-upgrades"