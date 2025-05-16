#!/bin/sh

# Đợi database sẵn sàng (tuỳ chọn)
# Bạn có thể dùng thêm sleep nếu cần
# sleep 10

# Chạy migration và seeding nếu cần
php artisan migrate --force

# Khởi động server Laravel
php artisan serve --host=0.0.0.0 --port=80
