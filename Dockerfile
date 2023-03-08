FROM nginx:latest

RUN apt-get update && apt-get install -y \
    nginx-extras \
    apache2-utils \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p "/media/data"
RUN chown -R www-data:www-data "/media/data"

COPY 05-volume-permission.sh /docker-entrypoint.d/05-volume-permission.sh
COPY nginx-dav.conf /etc/nginx/sites-enabled/default

ENV EXCHANGE_VOLUME_PATH=/media/data

VOLUME ${EXCHANGE_VOLUME_PATH}
