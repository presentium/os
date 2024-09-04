#!/bin/bash -e

# Add fstab entry for USB automount (on PRESENTIUM label)
echo "LABEL=PRESENTIUM /mnt/registration-certs auto nosuid,nodev,nofail,x-gvfs-show 0 0" >> "${ROOTFS_DIR}/etc/fstab"