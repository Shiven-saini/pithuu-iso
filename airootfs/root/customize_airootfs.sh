#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later

# To set locale for the live environment.
set -e -used -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

#########
# TODO-2 :
# To copy the dot files and themes to /etc/skel folder.
# I will rather implement a prepare script file, that will do the task of copying latest mirrorlist
# and gtk-4.0 and gnome-shell theme.
########

# Copying the skel configurations for root user as well, just to make system designing more consistent.
cp -aT /etc/skel/ /root/
chmod 700 /root

# Generate user directory folders, like Documents, Downloads etc.
runuser -l liveuser -c 'xdg-user-dirs-update'
runuser -l liveuser -c 'xdg-user-dirs-gtk-update'
xdg-user-dirs-update
xdg-user-dirs-gtk-update

# Setting GruvBox as the default theme

## GTK-3.0 and legacy gtk apps
gsettings set org.gnome.desktop.interface gtk-theme "Gruvbox"

## Icons set to papirus
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

## Gtk-4.0 symlinks
mkdir -p ~/.config
ln -s ~/.themes/Gruvbox/gtk-4.0 ~/.config/

## Shell theme
gsettings set org.gnome.shell.extensions.user-theme name "Gruvbox"

## Set Default font to overpass
gsettings set org.gnome.desktop.interface font-name "Overpass Regular 12"
gsettings set org.gnome.desktop.interface document-font-name "Overpass SemiBold 11"
gsettings set org.gnome.desktop.interface font "Overpass Regular 12"

## To enable login manager
systemctl enable gdm

# Enable pacman-init service to update the pacman databases and populate keyrings.
systemctl enable pacman-init.service

pacman -Sy
pacman-key --init
pacman-key --populate liveuser
