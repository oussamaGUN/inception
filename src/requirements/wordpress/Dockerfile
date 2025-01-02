FROM debian:buster

RUN apt-get update -y && apt install php-fpm php-mysql -y && apt install curl -y

COPY ./script.sh /
COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./wp-config.php /
RUN chmod +x /script.sh


ENTRYPOINT [ "/script.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]