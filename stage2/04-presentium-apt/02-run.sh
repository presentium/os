#!/bin/bash -e

on_chroot <<- \EOF
	systemctl enable presentium-client
    systemctl start presentium-client
EOF