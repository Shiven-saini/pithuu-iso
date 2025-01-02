#!/bin/bash

systemctl enable gdm.service
systemctl set-default graphical.target
systemctl enable NetworkManager.service

restore_files.sh

# Update the dconf database
dconf compile /etc/dconf/db/local /etc/dconf/db/local.d/
dconf update