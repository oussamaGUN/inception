#!/bin/bash

# Ensure required directories exist
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld
# Start MariaDB service
service mysql start

# Wait for MariaDB to start
sleep 5

# Run initial setup commands
if [ -n "$WP_TITLE" ] && [ -n "$WP_USER_LOGIN" ] && [ -n "$WP_USER_PASSWORD" ]; then
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${WP_TITLE}\`;"
    mysql -e "CREATE USER IF NOT EXISTS \`${WP_USER_LOGIN}\`@'localhost' IDENTIFIED BY '${WP_USER_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${WP_TITLE}\`.* TO \`${WP_USER_LOGIN}\`@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
else
    echo "Environment variables WP_TITLE, WP_USER_LOGIN, or WP_USER_PASSWORD are not set."
    exit 1
fi

# Shutdown MariaDB service
mysqladmin -u root -p$MARIADB_ROOT_PASSWORD shutdown

# Start MariaDB in safe mode
exec mysqld_safe