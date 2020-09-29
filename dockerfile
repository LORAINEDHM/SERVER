# J'indique l'image de base
FROM debian:buster

#WORKDIR /srcs
# J'indique qui detient le dockerfile
LABEL lduhamel="lduhamel@student.s19.be"

# je mets a jour l'image
RUN apt update
RUN apt upgrade -y

# j'installe wget afin de pouvoir telecharger les services depuis leur source URL
# edit : pas besoin si on utilise ADD
#RUN apt install -y wget

# INSTALL NGINX
RUN apt install -y nginx \
 && service nginx start

# INSTALL MYSQL
#RUN apt install -y mariadb-server


# INSTALL PHP
#RUN apt install -y php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl 
   # && service php7.3-fpm start 
  # && enable php7.3-fpm

# INSTALL MKCERT CERTIFICATE GENERATOR 
# package "certutil" necessaire pour generer certificats ssl avec mkcert
#RUN apt install -y libnss3-tools
#RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 
#RUN mv mkcert-v1.1.2-linux-amd64 mkcert \
    # chmod +x autorise l'exécution du fichier en tant que programme
#&& chmod +x mkcert \
#&& cp mkcert /usr/local/bin/ \
#&& mkcert -install \
#&& mkcert localhost

#RUN rm -rf /var/cache/apt/lists/*

# SETUP NGINX

WORKDIR /srcs
#COPY srcs/nginx-conf /etc/nginx/nginx-conf
#The way nginx and its modules work is determined in the configuration file. 
#By default, the configuration file is named nginx.conf and placed in the directory /usr/local/nginx/conf, /etc/nginx, or /usr/local/etc/nginx.
# example de fichier config dans /etc/nginx/sites-enabled/default
COPY srcs/nginx-conf /etc/nginx/sites-available/localhost
RUN rm /etc/nginx/sites-enabled/default
COPY srcs/nginx-conf /etc/nginx/sites-enabled/default
# activer l'hote virtuel disponible nouvelle cree en realisant un lien synmbolique 
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
#WORKDIR /etc
#RUN cp /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

#RUN rm -rf /var/cache/apt/lists/*

# # INSTALL PHPMYADMIN
# WORKDIR /var/www/html/phpmyadmin
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
#     && tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
#     && rm phpMyAdmin-4.9.0.1-all-languages.tar.gz
#     #&& mv phpMyAdmin-4.9.0.1-all-languages/ /var/www/phpmyadmin
# # config phpmyadmin => copier fichier de configuration minimal "config.sample.inc.php" situe dans var/www/phpmyadmin
# # et le mettre dans un nouveau fichier cree (ici config.inc.php), en autorisant "nopassword".
# COPY /srcs/config.inc.php/ var/www/phpmyadmin

# # INSTALL WORDPRESS
# RUN cd /var/www/html
# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xvzf latest.tar.gz
# RUN rm latest.tar.gz

# # SETUP MYSQL
# #RUN mysql -u root permet de se connecter au shell mysql, pour ensuite creer la database
# RUN service mysql start \
# && mysql -u root \
# #&& echo database.sql
# && echo "CREATE DATABASE wordpress;" | mysql -u root \
# && echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root \
# && echo "FLUSH PRIVILEGES;" | mysql -u root 
# #&& echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root

#ALLOW NGINX USER
#RUN chown -R www-data:www-data /var/www/*
#RUN chmod -R 755 /var/www/*

#EXPOSE 80

#COPY ./srcs/start.sh /var/

#RUN service php7.3-fpm start
#RUN service nginx restart
#RUN service mysql start
#CMD bash /var/start.sh

#RUN service mysql restart
#RUN service nginx restart

# je verifie la version installee (facultatif)
#RUN sudo nginx -v

# creation port (attention, ne pas preciser port hote et port dest type 80:80 sinon on ne pourra pas lancer 2 containers en meme temps)
#EXPOSE 80

# Le service nginx n'est pas démarré après l'installation. Vous pouvez taper la commande ci-dessous pour le faire manuellement. 
# Mais sachez qu'au prochain reboot de Debian, nginx démarrera automatiquement.
#nRUN sudo service nginx start


#RUN apt-get -y install mariadb-server

#RUN apt-get -y install phpmyadmin/phpmyadmin

#RUN service nginx restart
# commande pour garder nginx au 1er plan :
#CMD ["nginx", "-g", "daemon off;"]


# Je copie successivement les configurations et scripts de mon système hôte vers mon image
# COPY nginx.conf /etc/nginx/nginx.conf

#COPY srcs/start.sh /home/docker/script/start.sh
# J'applique les droits pour exécuter mon script
#RUN chmod 744 /home/docker/script/start.sh
# Je définie un point d'entrée : le premier script qui va se lancer au démarrage du container

#NTRYPOINT /home/docker/script/service_start.sh
# Le dossier dans lequel je serai quand j'exécuterai un nouveau container sera WORKDIR
# WORKDIR /home/docker

#CMD ["srcs/start.sh"]
CMD bash start.sh

#-p 80:80 => on redirige un port du conteneur vers un port de ma machine locale
# pour connaitre l'adresse IP localhost : docker-machine ip

EXPOSE 80