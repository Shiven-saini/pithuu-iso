#!/bin/bash

systemctl enable gdm.service

systemctl set-default graphical.target

systemctl enable NetworkManager.service

# Rebuild font cache
fc-cache -fv

# Set "Inter 11" as the default interface font
gsettings set org.gnome.desktop.interface font-name "Inter 11"

# Set "Cantarell 11" as the default document font
gsettings set org.gnome.desktop.interface document-font-name "Cantarell 11"

# Set "Source Code Pro 11" as the default monospace font
gsettings set org.gnome.desktop.interface monospace-font-name "Source Code Pro 12"