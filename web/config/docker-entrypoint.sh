#!/bin/sh

set -e
set -o pipefail

mkdir -p /etc/nginx/nginxconfig.io

dockerize \
  -template /tmp/nginx.conf.tmpl:/etc/nginx/nginx.conf \
  -template /tmp/default.conf.tmpl:/etc/nginx/conf.d/default.conf \
  -template /tmp/general.conf.tmpl:/etc/nginx/nginxconfig.io/general.conf \
  -template /tmp/php_fastcgi.conf.tmpl:/etc/nginx/nginxconfig.io/php_fastcgi.conf \
  -stdout /var/log/nginx/access.log \
  -stderr /var/log/nginx/error.log \
  nginx

exec bash