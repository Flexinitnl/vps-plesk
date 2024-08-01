#!/bin/bash
#    ______   _____  _______  ____________                       
#   / __/ /  / __/ |/_/  _/ |/ /  _/_  __/                       
#  / _// /__/ _/_>  <_/ //    // /  / /                          
# /_/ /____/___/_/|_/___/_/|_/___/ /_/                           
#   _   _____  ____     __         __                         __ 
#  | | / / _ \/ __/ ___/ /__ ___  / /__  __ ____ _  ___ ___  / /_
#  | |/ / ___/\ \  / _  / -_) _ \/ / _ \/ // /  ' \/ -_) _ \/ __/
#  |___/_/  /___/  \_,_/\__/ .__/_/\___/\_, /_/_/_/\__/_//_/\__/ '
#                         /_/          /___/                     


echo "Updating package list"
apt update

echo "Upgrading packages"
apt upgrade -y

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
echo "Apache modules enabled"
echo

# Install Plesk Extensions
echo "Installing Plesk Extensions"
if command -v curl &> /dev/null; then
    curl -fsSL https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/plesk-extensions.sh | bash
elif command -v wget &> /dev/null; then
    wget -qO- https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/plesk-extensions.sh | bash
else
    echo "Error: Neither curl nor wget is installed."
    exit 1
fi
echo "Plesk Extensions installed"

# Configure MySQL
echo "Configuring MySQL"
if command -v curl &> /dev/null; then
    curl -fsSL https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/configure-mysql.sh | bash
elif command -v wget &> /dev/null; then
    wget -qO- https://raw.githubusercontent.com/Flexinitnl/vps-plesk/main/scripts/configure-mysql.sh | bash
else
    echo "Error: Neither curl nor wget is installed."
    exit 1
fi
echo "MySQL Configuration Completed"


echo "Plesk Installation Completed"