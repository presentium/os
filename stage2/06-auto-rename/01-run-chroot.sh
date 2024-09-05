#!/bin/bash -e

tee /etc/presentium/randomhostname.sh << EOF
#!/bin/bash
# Description: Generate and set a random hostname on Linux
# Usage: set-random-hostname

__set_random_hostname() {

  # set a prefix if you'd like (thx for the idea @czerniachowicz)
  local prefix="presentium"

  # set the size of the randomly generated portion
  local random_size="6"

  # generate new hostname
  if [ -n "$prefix" ]; then
    local new_hostname="$(echo ${prefix} | sed -e 's/[^[:alnum:]]//g')-$(head -n1 < <(fold -w${random_size} < <(tr -cd 'a-z0-9' < /dev/urandom)))"
  else
    local new_hostname="$(head -n1 < <(fold -w${random_size} < <(tr -cd 'a-z0-9' < /dev/urandom)))"
  fi

  # ensure new hostname is not too long
  if [ ${#new_hostname} -gt 63 ]; then
    new_hostname=${new_hostname:0:63}
  fi

  # set new hostname
  hostnamectl set-hostname "$new_hostname"
  sed -i "/^127\.0\.1\.1\s/c\127.0.1.1       $new_hostname" /etc/hosts

}

# Check if the hostname is localhost and if so, set a random hostname
if [ "\$(hostname)" == "localhost" ]; then
  __set_random_hostname
fi

# Check if the hostname is presentium-device and if so, set a random hostname
if [ "\$(hostname)" == "presentium-device" ]; then
  __set_random_hostname
fi
EOF

chmod +x /etc/presentium/randomhostname.sh

echo "@reboot root /etc/presentium/randomhostname.sh" >> /etc/cron.d/presentium-rename