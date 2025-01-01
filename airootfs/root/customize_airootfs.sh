#!/bin/bash

systemctl enable gdm.service

systemctl set-default graphical.target

systemctl enable NetworkManager.service

# # Update the dconf database with custom settings

# apply the icon theme.
dconf compile /etc/dconf/db/local /etc/dconf/db/local.d/

mkdir -p /home/pithuu/.config/dconf/
dconf compile /home/pithuu/.config/dconf/user /etc/dconf/db/local.d/

dconf update