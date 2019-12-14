FROM php:7.4-fpm-buster
RUN  apt-get update && apt-get install --fix-missing -y \
        git \
        unzip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libwebp-dev \
        libjpeg-dev \
        curl \
        && pecl install mcrypt-1.0.3 \
        && docker-php-ext-enable mcrypt \
        #&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) iconv mysqli pdo pdo_mysql gd \
        #K&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include \
        && docker-php-ext-configure opcache --enable-opcache && docker-php-ext-install opcache \
        && pecl install xdebug && docker-php-ext-enable xdebug \
        && echo "Asia/Shanghai" > /etc/timezone \
        && apt-get purge -y --auto-remove \
        && rm -rf /var/cache/apt/* \
        && rm -rf /var/lib/apt/lists/* 
