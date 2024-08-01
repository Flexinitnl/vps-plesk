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

echo "Installing Plesk Extentions"
echo "Installing advisor"
plesk bin extension --install advisor
echo "Installing composer"
plesk bin extension --install composer
echo "Installing firewall"
plesk bin extension --install firewall
echo "Installing docker"
plesk bin extension --install docker
echo "Installing sectigo"
plesk bin extension --install sectigo
echo "Installing dnssec"
plesk bin extension --install dnssec
echo "Installing domain-connect"
plesk bin extension --install domain-connect
echo "Installing aast-dnssec"
plesk bin extension --install aast-dnssec
echo "Installing email-migration"
plesk bin extension --install email-migration
echo "Installing kaspersky-av"
plesk bin extension --install kaspersky-av
echo "Installing social-login"
plesk bin extension --install social-login
echo "Installing action-log"
plesk bin extension --install action-log
echo "Installing plesk-mobile"
plesk bin extension --install plesk-mobile
echo "Installing diskspace-usage-viewer"
plesk bin extension --install diskspace-usage-viewer
echo "Installing baqend"
plesk bin extension --install baqend
echo "Installing kolab"
plesk bin extension --install kolab
echo "Installing one-drive-backup"
plesk bin extension --install one-drive-backup
echo "Installing azuredns"
plesk bin extension --install azuredns
echo "Installing dns-transfer"
plesk bin extension --install dns-transfer
echo "Installing support-access"
plesk bin extension --install support-access
echo "Installing aps-autoprovision"
plesk bin extension --install aps-autoprovision
echo "Installing git"
plesk bin extension --install git
echo "installing plesk-multi-server"
plesk bin extension --install plesk-multi-server
echo "Installing website-virus-check"
plesk bin extension --install website-virus-check
echo "Installing letsencrypt"
plesk bin extension --install letsencrypt
echo "Installing panel-ini-editor"
plesk bin extension --install panel-ini-editor
echo "Installing ssh-keys"
plesk bin extension --install ssh-keys
echo "Installing slave-dns-manager"
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
