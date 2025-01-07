FROM debian:buster

RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y mariadb-server

COPY 50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

CMD ["/tmp/script.sh"]