FROM mogria/3source-phpcli:latest

MAINTAINER "Mogria" <m0gr14@gmail.com>

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y curl git php5-mcrypt php5-gd && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update
   

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

USER www-data
ENTRYPOINT ["composer"]
CMD ["--help"]
