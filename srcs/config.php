<? php
/**
 * vim: set expandtab sw = 4 ts = 4 m = 4: 
 */
/**
 * Exemple de configuration de phpMyAdmin, vous pouvez l'utiliser comme base pour
* configuration manuelle. Pour une conficd hguration plus facile, vous pouvez utiliser setup /
 *
 * Toutes les directives sont expliquées dans la documentation dans le dossier doc /
 * ou sur <https://docs.phpmyadmin.net/>.
 *
 * @package PhpMyAdmin
 */

/**
 * Ceci est nécessaire pour l'authentification basée sur les cookies pour crypter le mot de passe dans
* biscuit. Doit contenir 32 caractères.
 */
$ cfg [ 'blowfish_secret' ] = '' ; /* VOUS DEVEZ REMPLIR CECI POUR L'AUTH DU COOKIE! */

/**
 * Configuration des serveurs
 */
$ i = 0 ;

/**
 * Premier serveur
 */
$ i ++;
/* Type d'identification */
$ cfg [ 'Serveurs' ] [ $ i ] [ 'auth_type' ] = 'cookie' ;
/ * Paramètres du serveur * /
$ cfg [ 'Serveurs' ] [ $ i ] [ 'host' ] = 'localhost' ;
$ cfg [ 'Serveurs' ] [ $ i ] [ 'compress' ] = false ;
$ cfg [ 'Serveurs' ] [ $ i ] [ 'AllowNoPassword' ] = true ;

$ cfg [ 'UploadDir' ] = '' ;
$ cfg [ 'SaveDir' ] = '' ;






