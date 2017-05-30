#!/bin/bash

# docker build -t my-ruby-app ./docker-app
# docker build -t my-nginx ./docker-nginx
# docker run --name ruby-app -p 4567:4567 -d my-ruby-app
# docker run --name nginx-container \
#   -v $(pwd)/html:/usr/share/nginx/html:ro \
#   -v $(pwd)/docker-nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
#   --link ruby-app:app \
#   -P -d my-nginx
# curl http://$(docker-machine ip dev):32769/
# curl http://$(docker-machine ip dev):32769/test.html
# curl http://$(docker-machine ip dev):32769/app/
# curl http://$(docker-machine ip dev):32769/app/foo

docker build -t memo-nginx ./nginx
docker build -t memo-jenkins ./jenkins
# docker build -t memo-myHelloWorld ./myHelloWorld
# docker build -t memo-registry ./registry

docker run -it --name memo-nginx -v `pwd`/logs:/var/log/nginx memo-nginx
docker run -it --name memo-jenkins -v $PWD/jenkins:/var/jenkins_home:z -t jenkins

# docker run --name memo-nginx -p 80:8080 -d memo-nginx
# docker run --name memo-myHelloWorld -p 80:8080 -d memo-nginx
# docker run --name memo-registry -p 4567:4567 -d memo-registry
# docker run -d -p 49001:8080 -v $PWD/jenkins:/var/jenkins_home:z -t jenkins
