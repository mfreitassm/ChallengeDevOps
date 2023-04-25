#!/bin/bash

# php artisan key:generate
APP_KEY=$(php artisan key:generate --show)
echo $APP_KEY
php artisan jwt:generate
php artisan config:cache

while true; do
    php artisan migrate && break
    sleep 5 # delay between command runs
done

apache2-foreground
