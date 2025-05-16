FROM php:8.0-cli

RUN apt-get update && apt-get install -y \
    git zip unzip curl libpq-dev libpng-dev libonig-dev libxml2-dev \
    libjpeg62-turbo-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_pgsql mbstring bcmath pcntl gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY . .

RUN composer install --no-interaction --prefer-dist --optimize-autoloader
RUN php artisan config:cache && php artisan route:cache

RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache && \
    chmod -R 775 /var/www/storage /var/www/bootstrap/cache

EXPOSE 8000

CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=$(echo ${PORT:-8000} | awk '{print int($0)}')"]

