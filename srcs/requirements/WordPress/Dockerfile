# Penultimate stable version of Debian
FROM debian:bullseye

# Default port for PHP-FPM
EXPOSE	9000

ARG	PHPPATH=/etc/php/7.4/fpm

RUN	apt update && apt install --no-install-recommends --no-install-suggests -y \
	ca-certificates \
	php7.4-fpm \
	php7.4-mysql \
	mariadb-client \
	wget \
	tar \
	php-redis

# Download and extract WordPress
RUN wget https://wordpress.org/wordpress-6.3.1.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.3.1.tar.gz && rm wordpress-6.3.1.tar.gz

# Copy the WordPress configuration file
COPY ./wp-config.php /var/www/wordpress/

# Set ownership of the WordPress directory
RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress

# Configure PHP to work with WordPress
COPY ./www.conf /etc/php/7.4/fpm/pool.d/
RUN	mkdir -p /run/php

# Download and install WordPress Command Line Interface
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy the WordPress setup script
COPY ./auto_config.sh /bin/
RUN	chmod +x /bin/auto_config.sh

CMD	["sh", "/bin/auto_config.sh"]