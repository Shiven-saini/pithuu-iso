#!/bin/bash

# Set no password expiration for pithuu
chage -M 99999 pithuu

# Ensure no forced password change on first login
chage -d 0 pithuu
