#! /bin/bash
echo "Prepairing to update kernel"
apt update

echo "Prepairing to upgrade kernel"
apt upgrade -y

echo "Excecuting Plesk installation"
sh <(curl https://autoinstall.plesk.com/one-click-installer)


echo "enable Apache modules"

plesk sbin httpd_modules_ctl -e cgi mpm_prefork passenger sysenv
