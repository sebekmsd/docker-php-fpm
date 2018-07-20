FROM ubuntu:16.04

RUN apt-get update && apt-get upgrade ;\
    apt-get install -y software-properties-common python-software-properties ;\
    add-apt-repository ppa:ondrej/php ;\
    apt-get update


RUN apt-get install -y --allow-unauthenticated  php7.2-fpm 

RUN apt-get install -y --allow-unauthenticated php-pear php7.2-curl php7.2-dev php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml 

RUN sed -i 's/listen = \/run\/php\/php7.2-fpm.sock/listen = 9000/g' /etc/php/7.2/fpm/pool.d/www.conf  ;\
    mkdir /run/php

RUN apt-get install -y --allow-unauthenticated php7.2-pgsql 

RUN echo "php_flag[display_errors] = on" > /etc/php/7.2/fpm/pool.d/www.conf ; \
    curl -sS https://getcomposer.org/installer -o composer-setup.php ; \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer 

EXPOSE 9000

CMD php-fpm7.2 -y /etc/php/7.2/fpm/php-fpm.conf --pid /etc/php/7.2/fpm/php-fpm.pid -F
