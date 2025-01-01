#!/bin/bash

systemctl enable gdm.service

systemctl set-default graphical.target

systemctl enable NetworkManager.service

# Update the dconf database with custom settings
dconf update