# Set nginx base image
FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf:ro
COPY index.html /usr/share/nginx/html

EXPOSE 8080:80
EXPOSE 8484:8484
