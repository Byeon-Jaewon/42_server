CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'jbyeon'@'localhost' IDENTIFIED BY 'jbyeon';
GRANT ALL PRIVILEGES ON *.* TO 'jbyeon'@'localhost';
