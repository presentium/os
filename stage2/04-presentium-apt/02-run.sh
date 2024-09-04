#!/bin/bash -e

on_chroot <<- \EOF
	ln -s '/etc/systemd/system/presentium-client.service' '/etc/systemd/system/multi-user.target.wants/presentium-client.service'
EOF