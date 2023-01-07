#!/bin/bash

cd src

# Move this file to another dir
# Create Laravel Project
# Install only manually from attached container
# composer create-project laravel/laravel .

# Update composer (create folder vendor, storage, egc...)
composer update

# Install libraries
#composer require phpmailer/phpmailer \

# Run server
php artisan serve --env development --host 0.0.0.0
