FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade ;\
    apt-get install -y software-properties-common python-software-properties ;\
    add-apt-repository ppa:ondrej/php ;\
    apt-get update


RUN apt-get install -y --allow-unauthenticated  php7.2-fpm 

RUN apt-get install -y --allow-unauthenticated php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml 
