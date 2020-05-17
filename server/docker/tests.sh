#!/bin/sh

export CACHE_DRIVER=array
export DB_DATABASE=system
export DB_USERNAME=root
export DB_PASSWORD=root
export BROADCAST_DRIVER=log
export QUEUE_CONNECTION=sync

exec /var/www/html/vendor/bin/phpunit "$@"