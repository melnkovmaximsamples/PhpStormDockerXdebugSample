FROM php:8.2.1-fpm

USER root

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev \
    libfreetype6 \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install extensions
#RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
#RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-webp-dir=/usr/include/  --with-jpeg-dir=/usr/include/

# Install composer and set github token for correct pull laravel
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && chown -R www-data:www-data /usr/local/bin

# Copy existing application directory contents
COPY . /var/www

# Copy existing application directory permissions

# Change current user to www-data
USER www-data

# Create project
RUN cd /usr/local/bin && echo "{ }" > composer.json

# Expose port 9000 and start php-fpm server
EXPOSE 8000
CMD ["php-fpm"]
