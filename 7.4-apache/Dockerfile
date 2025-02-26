FROM php:7.4-apache

RUN apt-get update 
RUN apt-get install -y --no-install-recommends git 
RUN apt-get install -y --no-install-recommends unzip 
RUN apt-get install -y --no-install-recommends libbz2-dev 
RUN apt-get install -y --no-install-recommends libcurl3-dev 
RUN apt-get install -y --no-install-recommends libxml2-dev 
RUN apt-get install -y --no-install-recommends libssl-dev 
RUN apt-get install -y --no-install-recommends libpng-dev 
RUN apt-get install -y --no-install-recommends libgmp-dev 
RUN apt-get install -y --no-install-recommends libc-client-dev 
RUN apt-get install -y --no-install-recommends libkrb5-dev 
RUN apt-get install -y --no-install-recommends libldap2-dev 
RUN apt-get install -y --no-install-recommends libmcrypt-dev 
RUN apt-get install -y --no-install-recommends unixodbc-dev 
RUN apt-get install -y --no-install-recommends libpq-dev 
RUN apt-get install -y --no-install-recommends libtidy-dev 
RUN apt-get install -y --no-install-recommends libxml2-dev 
RUN apt-get install -y --no-install-recommends libxslt1-dev 
RUN apt-get install -y --no-install-recommends libzip-dev 
RUN apt-get install -y --no-install-recommends libonig-dev 
RUN apt-get install -y --no-install-recommends vim 

RUN pecl install mcrypt

RUN docker-php-source extract; \
	{ \
		echo '# https://github.com/docker-library/php/issues/103#issuecomment-271413933'; \
		echo 'AC_DEFUN([PHP_ALWAYS_SHARED],[])dnl'; \
		echo; \
		cat /usr/src/php/ext/odbc/config.m4; \
	} > temp.m4; \
	mv temp.m4 /usr/src/php/ext/odbc/config.m4; \
	apk add --no-cache unixodbc-dev; \
	docker-php-ext-configure odbc --with-unixODBC=shared,/usr;

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ 
    
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install mysqli 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install pdo_mysql 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install bcmath 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install bz2 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install calendar 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install ctype 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install curl 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install dom 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install exif 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install fileinfo 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install ftp 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install gd 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install gmp 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install iconv 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install imap 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install intl 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install json 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install ldap 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install mbstring 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install odbc 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install opcache 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install pdo 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install pgsql 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install session 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install simplexml 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install soap 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install tidy 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install xml 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install xmlreader 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install xmlrpc 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install xmlwriter 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install xsl 
RUN CFLAGS="-I/usr/src/php" docker-php-ext-install zip


RUN echo 'memory_limit = 640M' >> /usr/local/etc/php/php.ini && \
    echo 'post_max_size = 360M' >> /usr/local/etc/php/php.ini && \
    echo 'upload_max_filesize = 360M' >> /usr/local/etc/php/php.ini


RUN  CFLAGS="-I/usr/src/php" docker-php-ext-install gettext 

RUN a2enmod rewrite
