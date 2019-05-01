#!/bin/bash

old_kernel=$(rpm -q kernel | grep -v kernel-$(uname -r))
if [ -n "$old_kernel" ]; then
    yum -y remove $old_kernel
fi
