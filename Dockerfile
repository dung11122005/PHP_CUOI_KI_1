# FROM php:8.0-cli

# RUN apt-get update && apt-get install -y \
#     git zip unzip curl libpq-dev libpng-dev libonig-dev libxml2-dev \
#     libjpeg62-turbo-dev libfreetype6-dev \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install pdo_pgsql mbstring bcmath pcntl gd \
#     && pecl install redis \
#     && docker-php-ext-enable redis \
#     && apt-get clean && rm -rf /var/lib/apt/lists/*


# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# WORKDIR /var/www
# COPY . .

# RUN composer install --no-interaction --prefer-dist --optimize-autoloader
# RUN php artisan config:cache && php artisan route:cache

# RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache && \
#     chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# EXPOSE 8000

# CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=$(echo ${PORT:-8000} | awk '{print int($0)}')"]

FROM php:8.0-fpm

# Cài thư viện hệ thống và PHP extension cần thiết cho PostgreSQL
RUN apt-get update && apt-get install -y \
    libpng-dev libonig-dev libxml2-dev zip unzip git curl libpq-dev \
    && docker-php-ext-install pdo_mysql pdo_pgsql pgsql mbstring exif pcntl bcmath gd

# Cài Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Đặt thư mục làm việc
WORKDIR /var/www

# Copy mã nguồn Laravel vào container
COPY . .

# Cài các dependency Laravel
RUN composer install --no-interaction --prefer-dist --no-scripts --no-dev

# Set quyền cho Laravel
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/storage /var/www/bootstrap/cache

# Expose cổng 80
EXPOSE 80

# Copy script start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh

# CMD khởi động
CMD ["/start.sh"]

