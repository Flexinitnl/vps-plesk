#!/bin/bash

# Update the package list
clear
echo "Preparing to update kernel"
apt update

# Upgrade the packages
echo "Preparing to upgrade kernel"
apt upgrade -y

# Install Plesk
echo "Executing Plesk installation"
if command -v curl &> /dev/null; then
    sh <(curl -fsSL https://autoinstall.plesk.com/one-click-installer)
elif command -v wget &> /dev/null; then
    sh <(wget -qO- https://autoinstall.plesk.com/one-click-installer)
else
    echo "Error: Neither curl nor wget is installed."
    exit 1
fi

# Enable Apache modules
echo "Enabling Apache modules"
plesk sbin httpd_modules_ctl -e cgi mpm_prefork passenger sysenv
echo
echo "Apache modules enabled"
echo "Plesk installation and configuration completed."
