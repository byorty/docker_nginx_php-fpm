server {
    listen 80;
    server_name ${DOMAIN};
    root /app/www;

    access_log /var/log/nginx/${DOMAIN}.access.log;
    error_log /var/log/nginx/${DOMAIN}.error.log;

    location / {
        try_files $uri @backend;
    }

    location ~* \.(woff|ttf|svg|eot|otf)$ {
        add_header Access-Control-Allow-Origin *;
    }

    location @backend {
        include             fastcgi_params;
        fastcgi_pass        php-fpm:9000;
        fastcgi_param       SCRIPT_FILENAME /app/www/index.php;
        fastcgi_buffer_size 256k;
        fastcgi_buffers     4 256k;
    }
}