#!/bin/bash
php artisan migrate --force

php artisan config:clear
php artisan cache:clear
php artisan view:clear

php artisan serve --host=0.0.0.0 --port=$PORT
