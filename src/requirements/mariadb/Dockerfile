FROM debian:buster 

RUN apt-get update && apt-get install -y mariadb-server

COPY ./my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./srcipt.sh /


RUN chmod +x /srcipt.sh

CMD ["/srcipt.sh"]