#!/bin/bash -e

curl -s --compressed "https://deb.presentium.ch/KEY.gpg" | gpg --dearmor | tee ${ROOTFS_DIR}/etc/apt/trusted.gpg.d/presentium.gpg >/dev/null
curl -s --compressed -o ${ROOTFS_DIR}/etc/apt/sources.list.d/presentium.list "https://deb.presentium.ch/presentium.list"

on_chroot <<- \EOF
	apt-get update
EOF