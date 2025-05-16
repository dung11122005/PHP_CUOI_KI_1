FROM php:8.0-fpm

RUN apt-get update && apt-get install -y \
    git zip unzip curl libpq-dev libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_pgsql mbstring bcmath pcntl gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY . .

RUN composer install --no-interaction --prefer-dist --optimize-autoloader

RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

ENV PORT 8000
EXPOSE ${PORT}

CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=${PORT}"]
