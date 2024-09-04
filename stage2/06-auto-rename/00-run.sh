install -m 644 files/randomhostname.sh "${ROOTFS_DIR}/etc/init.d/randomhostname.sh"

on_chroot << EOF
chmod +x /etc/init.d/randomhostname.sh
update-rc.d randomhostname.sh defaults
EOF