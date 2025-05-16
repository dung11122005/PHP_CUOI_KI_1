# -----------------------------------------------------------------
# 1. PHP runtime ― dùng php:8.1-cli (built-in server nhẹ hơn fpm)
# -----------------------------------------------------------------
FROM php:8.1-cli

# 2. Cài thư viện hệ thống & PHP extensions cần cho Laravel + PGSQL
RUN apt-get update && apt-get install -y \
    git zip unzip curl libpq-dev \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_pgsql pgsql mbstring bcmath pcntl gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*



# 3. Cài Composer (lấy từ image chính thức)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Copy source & cài dependency PHP
WORKDIR /var/www
COPY . .
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# 5. Quyền thư mục writable
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 storage bootstrap/cache

# 6. Expose PORT do Render/Railway cấp (mặc định 8080/3000/10000)
#    Dùng biến môi trường PORT nếu được platform set,
#    ngược lại fallback 8000 khi chạy local Docker
ENV PORT 8000
EXPOSE ${PORT}

# 7. Start Laravel với built-in server
#    Render:        PORT=10000  ; Railway: PORT=3000
CMD ["sh", "-c", "php artisan serve --host=0.0.0.0 --port=${PORT}"]
