# version 0.0.1
FROM ubuntu:18.04

MAINTAINER winghimjns

ENV DEBIAN_FRONTEND=noninteractive

RUN rm -rf /var/lib/apt/lists/*

RUN echo 'Asia/Seoul' > /etc/timezone

RUN apt-get update

RUN apt-get install -yq --no-install-recommends \
    ca-certificates \
    apt-utils \
    curl \
    perl \
    liberror-perl \
    git \
    apache2 \
    libapache2-mod-php7.2 \
    php7.2-cli \
    php7.2-json \
    php7.2-curl \
    php7.2-fpm \
    php7.2-gd \
    php7.2-ldap \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-soap \
    php7.2-sqlite3 \
    php7.2-xml \
    php7.2-zip \
    php7.2-intl \
    libgomp1 \
    libfftw3-double3 \
    libmagickcore-6.q16-3 \
    libmagickwand-6.q16-3 \
    libgraphicsmagick-q16-3 \
    php-imagick \
    openssl \
    nano \
    apache2-api-20120211 \
    apache2-bin \
    graphicsmagick \
    imagemagick \
    ghostscript \
    mysql-client \
    iputils-ping \
    nodejs \
    npm \
    locales \
    sqlite3

RUN apt-get clean

RUN rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN locale-gen en_US.UTF-8 en_GB.UTF-8 zh_TW.UTF-8 ko_KR.UTF-8

RUN a2enmod rewrite

WORKDIR /var/www/html

CMD ["apache2ctl", "-D", "FOREGROUND"]

