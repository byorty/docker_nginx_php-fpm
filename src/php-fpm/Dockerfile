FROM alpine:edge

RUN apk --update add \
    php7 \
    php7-fpm

RUN rm -rf /var/cache/apk/*

COPY www.conf /etc/php7/pool.d/www.conf
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY php.ini /etc/php7/php.ini

RUN ln -s /usr/bin/php7 /usr/bin/php

VOLUME ["/var/log/php", "/app"]

EXPOSE 9000

CMD ["php-fpm7", "-F"]