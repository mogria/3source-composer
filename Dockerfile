FROM mogria/3source-phpcli:latest

MAINTAINER "Mogria" <m0gr14@gmail.com>

WORKDIR /tmp
USER root

COPY toolscript.sh /usr/bin/toolscript.sh
RUN chmod +x /usr/bin/toolscript.sh


RUN apk add --update \
    curl \
    git \
    && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update && \
    composer global require "phpunit/phpunit=5.*.*"

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

USER www-data
ENTRYPOINT ["umask-wrapper.sh", "toolscript.sh"]
CMD ["--help"]
