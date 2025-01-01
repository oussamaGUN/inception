FROM debian:buster

RUN apt-get update -y && apt install php-fpm php-mysql -y && apt install curl -y

COPY ./script.sh /

RUN chmod +x /script.sh

COPY ./html /var/www/html

COPY ./wp-config.php /

CMD ["/script.sh"]