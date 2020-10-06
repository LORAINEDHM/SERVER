CREATE DATABASE wordpress;
CREATE USER 'user42'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'user42'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;