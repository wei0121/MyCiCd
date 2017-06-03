# Set nginx base image
FROM nginx

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY index.html /usr/share/nginx/index.html

EXPOSE 8888
EXPOSE 8080
EXPOSE 8484
