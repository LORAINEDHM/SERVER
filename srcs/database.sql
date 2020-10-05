CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'user42'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL ON wordpress.* TO 'user42'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;