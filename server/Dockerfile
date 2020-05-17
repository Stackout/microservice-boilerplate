FROM xovenia/crypto-php:7.3.14

LABEL maintainer="me@ryanhein.com"

COPY --chown=www-data:www-data . /var/www/html
COPY docker/tests.sh /usr/local/bin/tests

RUN chmod -R 777 /var/www/html/storage && \
  chown -R www-data:www-data /var/www

RUN composer install --no-interaction --no-progress --no-suggest