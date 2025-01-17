#!/bin/bash

# Start the MariaDB service
service mysql start
sleep 10

# Create the database
mysql -u root -proot_password -e "CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;"
mysql -u root -proot_password -e "CREATE USER IF NOT EXISTS \`$SQL_USER\`@'localhost' IDENTIFIED BY '$SQL_PASSWORD';"

mysql -u root -proot_password -e "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO \`$SQL_USER\`@'%' IDENTIFIED BY '$SQL_PASSWORD';"

mysql -u root -proot_password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

mysql -u root -proot_password -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown


exec mysqld_safe