#!/bin/bash
#tail -f /dev/null
sleep 20
while ! mariadb -h mariadb -u $SQL_USER -p$SQL_PASSWORD;
do
    echo "waiting..."
    sleep 2
done

# Install WordPress
wp core install --url="$WP_URL" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email \
    --path='/var/www/wordpress' \
    --allow-root

# Create a new WordPress user
wp user create "$WP_USER" "$WP_EMAIL" \
    --user_pass="$WP_PASSWORD" \
    --role="$WP_ROLE" \
    --path='/var/www/wordpress' \
    --allow-root



/usr/sbin/php-fpm7.4 -F