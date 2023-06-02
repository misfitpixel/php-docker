LABEL org.opencontainers.image.source=https://github.com/misfitpixel/php-docker
LABEL org.opencontainers.image.description="PHP Base Container"
LABEL org.opencontainers.image.licenses=MIT

FROM php:7.4.33-apache

# install core extensions.
RUN apt-get update && apt-get install -y \
    libxslt-dev \
    libsodium-dev \
    libzip-dev \
    git \
    libpng-dev \
    apt-utils \
    nano \
    vim

RUN docker-php-ext-install xsl
RUN docker-php-ext-install sodium
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install gd

RUN pecl install zip && \
    docker-php-ext-install zip

RUN docker-php-ext-install pdo_mysql

RUN pecl install -o -f redis-5.0.2 \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis

RUN a2enmod rewrite
RUN a2enmod headers

RUN echo "upload_tmp_dir = /var/www/html" >> /usr/local/etc/php/conf.d/custom.ini
RUN echo "display_errors = 0"  >> /usr/local/etc/php/conf.d/custom.ini
