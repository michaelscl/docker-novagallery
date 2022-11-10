FROM php:7-apache

RUN    apt-get update					\
    && apt-get upgrade -y 				\
    && apt-get install 					\
		mc systemctl zlib1g-dev libpng-dev -y	\
    && apt-get clean					\
    && cd /tmp 						\
    && curl --output /tmp/novagallery-free.zip https://download.novafacile.com/novagallery/novagallery-free.zip \
    && unzip novagallery-free.zip -d /tmp/ngf		\
    && cd /tmp/ngf					\
    && cd `dir`						\
    && cp -rf * /var/www/html				\
    && chown -R www-data:www-data /var/www/html/*	\
    && chmod a+w /var/www/html/nova-config 		\
    && chmod a+w /var/www/html/galleries		\
    && cd /						\
    && rm -rf /tmp/*					\
    && docker-php-ext-install exif gd			\
    && docker-php-ext-enable exif gd

VOLUME	/var/www/html/nova-config /var/www/html/galleries

