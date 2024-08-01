#!/bin/bash

# Stop the MySQL service
sudo service mysql stop

# Edit the MySQL configuration file
sudo sed -i 's/innodb_strict_mode=ON/innodb_strict_mode=OFF/g' /etc/mysql/my.cnf

# Start the MySQL service
sudo service mysql start