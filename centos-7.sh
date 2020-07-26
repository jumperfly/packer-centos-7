#!/bin/bash

# SSH/DNS optimisations
echo 'RES_OPTIONS="single-request-reopen"' >> /etc/sysconfig/network
sed -i 's/^#\?UseDNS .*/UseDNS no/' /etc/ssh/sshd_config
sed -i 's/^#\?GSSAPIAuthentication .*/GSSAPIAuthentication no/' /etc/ssh/sshd_config

# Install additions
yum -y install kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc bzip2
mount /root/VBoxGuestAdditions.iso /mnt
/mnt/VBoxLinuxAdditions.run
umount /mnt
rm /root/VBoxGuestAdditions.iso

# Cleanup
rm -f /tmp/vboxadd*
rm -f /var/log/vboxadd*
YUM_HISTORY_REGEX='^ \+\([0-9]\+\).*'
last_transaction=$(yum history | grep "$YUM_HISTORY_REGEX" | head -1 | sed "s/$YUM_HISTORY_REGEX/\1/")
yum -y history rollback $((last_transaction - 1))

old_kernel=$(rpm -q kernel | grep -v kernel-$(uname -r))
if [ -n "$old_kernel" ]; then
    yum -y remove $old_kernel
fi
yum clean all
rm -rf /var/cache/yum

rm -f /etc/ssh/*key*
find /var/log -type f -exec truncate --size=0 {} \;
truncate --size=0 /etc/machine-id

# Shrink disk
dd if=/dev/zero of=/boot/ZERO bs=1M || echo "ignoring expected dd error"
rm /boot/ZERO
dd if=/dev/zero of=/ZERO bs=1M  || echo "ignoring expected dd error"
rm /ZERO
sync

export HISTSIZE=0
rm -f /root/.wget-hsts
