FROM php:7.4-fpm-buster
RUN  apt-get update && apt-get install --fix-missing -y \
        git \
        unzip \
        #php-mbstring \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libwebp-dev \
        libjpeg-dev \
        curl \
        #libmemcached-dev \
        #&& pecl install memcached-2.2.0 \
        #&& docker-php-ext-enable memcached\
        && pecl install mcrypt-1.0.3 \
        && docker-php-ext-enable mcrypt \
        && docker-php-ext-install -j$(nproc) iconv mysqli pdo pdo_mysql \
        #&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        #K&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include \
        && docker-php-ext-install -j$(nproc) gd \
        && pecl install xdebug && docker-php-ext-enable xdebug \
        && echo "Asia/Shanghai" > /etc/timezone \
        && apt-get purge -y --auto-remove \
        && rm -rf /var/cache/apt/* \
        && rm -rf /var/lib/apt/lists/* 
