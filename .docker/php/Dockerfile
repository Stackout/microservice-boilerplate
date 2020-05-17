FROM php:7.3.14-fpm-alpine

LABEL maintainer="me@ryanhein.com"

# System and PHP Dependencies

RUN apk add --no-cache --update zlib
RUN set -xe \
  && apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
  && pecl install -o -f redis \
  && docker-php-ext-enable redis \
  && rm -rf /usr/share/php7 \
  && rm -rf /tmp/* \
  && apk del .phpize-deps

RUN apk add --update --no-cache \
    libzip-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    freetype-dev \
    supervisor \
  && NPROC=$(getconf _NPROCESSORS_ONLN) \
  && docker-php-ext-install -j${NPROC} iconv pdo pdo_mysql opcache zip bcmath sockets \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j${NPROC} gd \
  && docker-php-ext-install pcntl
  
# Composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_VERSION_SHA1 cb19f2aa3aeaa2006c0cd69a7ef011eb31463067
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/$COMPOSER_VERSION_SHA1/web/installer -O - -q | php -- --quiet \
  && mv composer.phar /usr/local/bin/composer

COPY php.ini /usr/local/etc/php/php.ini

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD []