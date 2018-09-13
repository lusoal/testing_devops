FROM ubuntu:16.04

MAINTAINER Lucas Duarte

RUN apt-get update \
&& apt-get install nginx -y \
&& apt-get clean && rm -rf /var/www/html/*

#Meu website simples
COPY index.html /var/www/html/

#Expose para ja expor a porta quando subir o Container
EXPOSE 	80

CMD ["nginx", "-g", "daemon off;"] 
