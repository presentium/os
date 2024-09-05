#!/bin/bash -e

echo "i2c-dev" >> /etc/modules
echo "SUBSYSTEM==\"i2c-dev\",KERNEL==\"i2c-[0-9]+\", GROUP=\"i2c\", MODE=\"0660\"" >> /lib/udev/rules.d/60-i2c-tools.rules
