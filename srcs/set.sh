#!/bin/bash

chmod 775 /run.sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=jbyeon/CN=localhost" -keyout /etc/ssl/private/mycert.key -out /etc/ssl/certs/mycert.crt
chmod 600 etc/ssl/certs/mycert.crt etc/ssl/private/mycert.key

cp -rp /tmp/default /etc/nginx/sites-available/

service mysql start


wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
mv phpmyadmin /var/www/html/
rm phpMyAdmin-5.0.2-all-languages.tar.gz
cp -rp /tmp/config.inc.php /var/www/html/phpmyadmin/

mysql < /var/www/html/phpmyadmin/sql/create_tables.sql -u root --skip-password
mysql < /tmp/wp_db.sql -u root --skip-password


wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ var/www/html/
cp -rp ./tmp/wp-config.php /var/www/html/wordpress

service nginx start
service php7.3-fpm start
service mysql restart

bash
