FROM		debian:buster
MAINTAINER	jbyeon@student.42seoul.kr
RUN			apt update
RUN			apt-get install -y nginx \
			mariadb-server php-mysql \
			openssl wget php7.3-fpm
