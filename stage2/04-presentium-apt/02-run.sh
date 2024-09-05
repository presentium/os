#!/bin/bash -e

ln -s ${ROOTFS_DIR}/etc/systemd/system/presentium-client.service ${ROOTFS_DIR}/etc/systemd/system/multi-user.target.wants/presentium-client.service
