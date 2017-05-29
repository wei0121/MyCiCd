# Set nginx base image
FROM nginx:alpine

rm /etc/nginx/conf.d/*
COPY nginx.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html

EXPOSE 8080
