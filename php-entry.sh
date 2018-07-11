#! /bin/bash
if [ ! -f /var/www/${APP_NAME}/public/index.php ]; then
  composer create-project --prefer-dist laravel/laravel ${APP_NAME};
  rm ./${APP_NAME}/.env;
  cp /.env ./${APP_NAME}/.env;
  cd ${APP_NAME};
  php artisan key:generate;
fi

docker-php-entrypoint php-fpm;