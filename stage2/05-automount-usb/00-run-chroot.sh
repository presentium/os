#!/bin/bash -e

mkdir /mnt/registration-token

# Add fstab entry for USB automount (on PRESENTIUM label)
echo "LABEL=PRESENTIUM /mnt/registration-token auto nosuid,nodev,nofail,x-gvfs-show 0 0" >> /etc/fstab