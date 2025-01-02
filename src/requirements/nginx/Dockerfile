FROM alpine:3.7

RUN apk update && apk add nginx && apk add openssl

RUN mkdir -p /run/nginx

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=agadir/L=agadir/O=42/OU=42/CN=localhost"

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
