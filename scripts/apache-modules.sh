#!/bin/bash

# Add Apache modules
plesk sbin httpd_modules_ctl -e cgi
plesk sbin httpd_modules_ctl -e mpm_prefork
plesk sbin httpd_modules_ctl -e passenger
plesk sbin httpd_modules_ctl -e sysenv

# Restart Apache
service apache2 restart