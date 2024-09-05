install -m 755 files/randomhostname.sh "${ROOTFS_DIR}/etc/presentium/randomhostname.sh"

echo "@reboot root /etc/presentium/randomhostname.sh" >> "${ROOTFS_DIR}/etc/cron.d/presentium-rename"
