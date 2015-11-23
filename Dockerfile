FROM mogria/3source-phpcli:latest

MAINTAINER "Mogria" <m0gr14@gmail.com>

WORKDIR /tmp

RUN apk add --update curl git php-mcrypt php-gd && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update && \
    apk del curl
   

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

USER www-data
ENTRYPOINT ["umask-wrapper.sh", "composer"]
CMD ["--help"]
