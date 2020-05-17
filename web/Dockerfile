FROM nginx:1.14.2-alpine

RUN set -x \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data

RUN apk add --no-cache openssl 

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY ./config /tmp
COPY ./config/docker-entrypoint.sh /usr/local/bin/
COPY --chown=www-data:www-data public /var/www/html

RUN mkdir /var/www/storage && \
    chmod -R 777 /var/www/storage

ENTRYPOINT [ "docker-entrypoint.sh" ]