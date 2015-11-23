FROM mogria/3source-phpcli:latest

MAINTAINER "Mogria" <m0gr14@gmail.com>

WORKDIR /tmp

USER root
RUN apk add --update \
    curl \
    git \
    php-dom \
    php-gd \
    php-json \
    php-mcrypt \
    php-openssl \
    php-phar \
    && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

USER www-data
ENTRYPOINT ["umask-wrapper.sh", "composer"]
CMD ["--help"]
