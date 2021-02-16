FROM nginx:1.10.2
MAINTAINER Kyle Mathews "mathews.kyle@gmail.com"

RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types
COPY nginx.conf /etc/nginx/nginx.conf
COPY basic.conf /etc/nginx/basic.conf
COPY mime.types /etc/nginx/mime.types
RUN mkdir /etc/nginx/ssl
COPY default /etc/nginx/sites-enabled/default
COPY default-ssl /etc/nginx/sites-available/default-ssl
COPY directive-only /etc/nginx/directive-only
COPY location /etc/nginx/location
RUN sed -i "s/listen 80/listen 8080/g" /etc/nginx.conf
RUN chgrp -R 0 /var/opt/rh/rh-nginx18 && chmod -R g=u /var/opt/rh/rh-nginx18

# expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443
EXPOSE 8080


CMD ["nginx"]

