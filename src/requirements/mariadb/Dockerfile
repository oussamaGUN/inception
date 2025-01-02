FROM debian:buster 

RUN apt-get update && apt upgrade -y && apt-get install mariadb-server -y
COPY ./my.cnf /etc/mysql/mariadb.conf.d/

COPY ./srcipt.sh /

RUN chmod +x /srcipt.sh

EXPOSE 3306

CMD ["/srcipt.sh"]