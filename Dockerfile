FROM wordpress:php8.0-apache

RUN echo "serverName 127.0.0.1" >> /etc/apache2/apache2.conf

RUN apachectl configtest

RUN echo "php_value upload_max_filesize 256M" >> /var/www/html/.htaccess
RUN echo "php_value post_max_size 256M" >> /var/www/html/.htaccess

RUN service apache2 restart

RUN touch /var/www/html/healthcheck.html

CMD ["apache2-foreground"]
    