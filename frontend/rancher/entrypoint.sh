#!/usr/bin/env bash

sed -i -e 's@"http://13.59.163.245/api"@'\"${API_HOST}\"'@g' /var/www/openloyalty/front/config.js
nginx -g 'daemon off;'
