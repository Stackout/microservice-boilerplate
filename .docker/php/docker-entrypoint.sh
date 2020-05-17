#!/bin/sh

set -e
set -o pipefail

role=${CONTAINER_ROLE:-app}
env=${APP_ENV:-production}

if [ "$env" = "tests" ]; then
  exec "$@"
fi

if [ "$env" != "local" ]; then
    echo "Caching configuration..."
    (cd /var/www/html && php artisan config:cache && php artisan route:cache && php artisan view:cache)
fi

if [ "$role" = "app" ]; then

  if [ "$env" != "local" ]; then
    echo "Running deployment command..."
    (cd /var/www/html && php artisan app:deploy --force)
  fi

  echo "Main server starting..."
  exec php-fpm

fi