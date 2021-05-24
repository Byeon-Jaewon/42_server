FROM		debian:buster
MAINTAINER	jbyeon@student.42seoul.kr
RUN			apt update
RUN			apt-get install -y nginx \
			mariadb-server php-mysql \
			openssl wget php7.3-fpm

COPY		./srcs/set.sh ./
COPY		./srcs/default ./tmp
COPY		./srcs/wp-config.php ./tmp
COPY		./srcs/config.inc.php ./tmp
COPY		./srcs/wp_db.sql ./tmp

EXPOSE 80 443

CMD			bash set.sh

