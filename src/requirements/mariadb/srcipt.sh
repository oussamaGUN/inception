#!/bin/bash



service mysql start

mysql -u root -e "CREATE DATABASE IF NOT EXISTS test_db;"

# Connect to MySQL as root and create a new user
mysql -u root -e "CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';"

# Grant all privileges to the new user on a specific database
mysql -u root -e "GRANT ALL PRIVILEGES ON database_name.* TO 'newuser'@'localhost';"

# Flush privileges to ensure that the changes take effect
mysql -u root -e "FLUSH PRIVILEGES;"
