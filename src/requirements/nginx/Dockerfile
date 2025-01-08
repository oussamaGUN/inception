FROM debian:buster

RUN apt-get update && apt-get install -y nginx

RUN apt install vim -y    

RUN apt install curl -y 

RUN mkdir -p /etc/nginx/ssl

RUN apt-get install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ousabbar.42.fr/UID=ousabbar"

RUN mkdir -p /var/run/nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]