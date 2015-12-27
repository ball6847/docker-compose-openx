#!/bin/sh

cd /var/www/html

if [[ "`find var -type f`" == "var/.gitkeep" ]]; then
    mkdir -p var/cache var/plugins/{DataObjects,recover} var/templates_compiled
    touch var/UPGRADE
fi

chown -R nobody:nobody /var/www/html/plugins /var/www/html/var/ /var/www/html/www/images

php-fpm && nginx -g 'daemon off;'
