#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e -u

runuser -l liveuser -c 'xdg-user-dirs-update'
runuser -l liveuser -c 'xdg-user-dirs-gtk-update'
xdg-user-dirs-update
xdg-user-dirs-gtk-update
