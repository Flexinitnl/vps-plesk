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
# Update the package list

echo "Preparing to update kernel"
apt update

# Upgrade the packages
echo "Preparing to upgrade kernel"
apt upgrade -y

# Install Plesk
# echo "Executing Plesk installation"
# if command -v curl &> /dev/null; then
#     sh <(curl -fsSL https://autoinstall.plesk.com/one-click-installer)
# elif command -v wget &> /dev/null; then
#     sh <(wget -qO- https://autoinstall.plesk.com/one-click-installer)
# else
#     echo "Error: Neither curl nor wget is installed."
#     exit 1
# fi

# Enable Apache modules
echo "Enabling Apache modules"
plesk sbin httpd_modules_ctl -e cgi mpm_prefork passenger sysenv
echo
echo "Apache modules enabled"
echo "Plesk installation and configuration completed."

echo "Installing Plesk Extentions"
plesk bin extension --install advisor
plesk bin extension --install composer
plesk bin extension --install firewall
plesk bin extension --install docker
plesk bin extension --install sectigo
plesk bin extension --install dnssec
plesk bin extension --install domain-connect
plesk bin extension --install aast-dnssec
plesk bin extension --install email-migration
plesk bin extension --install kaspersky-av
plesk bin extension --install social-login
plesk bin extension --install action-log
plesk bin extension --install plesk-mobile
plesk bin extension --install diskspace-usage-viewer
plesk bin extension --install baqend
plesk bin extension --install kolab
plesk bin extension --install one-drive-backup
plesk bin extension --install azuredns
plesk bin extension --install dns-transfer
plesk bin extension --install support-access
plesk bin extension --install aps-autoprovision
plesk bin extension --install git
plesk bin extension --install website-virus-check
plesk bin extension --install letsencrypt
plesk bin extension --install panel-ini-editor
plesk bin extension --install ssh-keys
plesk bin extension --install slave-dns-manager

echo "Plesk Extentions are installed"


echo "Configure MySQL"
echo "innodb_strict_mode=OFF" >> /etc/mysql/my.cnf
echo "Restarting MySQL"
systemctl restart mysql
echo "MySQL Configuration Completed"


echo "Plesk Installation Completed"
echo "Please login to Plesk Panel to configure your server"
echo "Plesk Panel URL: https://<your-server-ip>:8443"
echo "Username: admin"
echo "Password: <your-password>"
echo "Please change your password after login"
echo "Thank you for using this script"
echo "Goodbye!"
