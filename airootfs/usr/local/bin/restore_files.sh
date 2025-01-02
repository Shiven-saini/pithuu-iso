#!/bin/bash
# Author: Shiven Saini <shiven.career@proton.me>

# Script to restore default lsb-release and os-release files

# Copying back the default files
echo "Restoring /etc/lsb-release..."
cp /usr/local/share/lsb-release /etc/lsb-release

echo "Restoring /usr/lib/os-release..."
cp /usr/local/share/os-release /usr/lib/os-release

# Setting correct permissions
echo "Setting permissions for /etc/lsb-release..."
chmod 644 /etc/lsb-release

echo "Setting permissions for /usr/lib/os-release..."
chmod 644 /usr/lib/os-release

echo "Restoration complete!"