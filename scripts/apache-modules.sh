#!/bin/bash

# Add Apache modules
plesk bin apache_modules --add cgi
plesk bin apache_modules --add mpm_prefork
plesk bin apache_modules --add passenger
plesk bin apache_modules --add sysenv

# Restart Apache
service apache2 restart