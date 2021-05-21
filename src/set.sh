#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=jbyeon/CN=localhost" -keyout /etc/ssl/private/mycert.key -out /etc/ssl/certs/mycert.crt
chmod 600 etc/ssl/certs/mycert.crt etc/ssl/private/mycert.key


