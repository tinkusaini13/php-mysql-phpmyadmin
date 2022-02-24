FROM php:7.4-apache
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync
# much simplier to use ARG instead of specifiying it each time on the FLY before each install command
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -qq \
    curl \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mysqli zip \
    && a2enmod rewrite
WORKDIR /var/www/html
EXPOSE 80
