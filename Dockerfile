FROM nginx:latest

RUN apt-get update && apt-get install -y \
    nginx-extras \
    apache2-utils \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p "/media/data"
RUN chown -R www-data:www-data "/media/data"

COPY nginx-dav.conf /etc/nginx/sites-enabled/default

VOLUME /media/data

CMD chmod a+x /media/data && nginx -g "daemon off;"
