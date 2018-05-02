#!/usr/bin/env bash

sed -i -e 's@"http://18.217.98.119/api"@'\"${API_HOST}\"'@g' /var/www/openloyalty/front/config.js
nginx -g 'daemon off;'
