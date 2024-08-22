FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    vim \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install mysqli

RUN a2enmod rewrite

COPY ./src/public /var/www/html

RUN chmod a+rwx /var/www/html

WORKDIR /var/www/html

EXPOSE 80
