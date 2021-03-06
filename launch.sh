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



docker build -t memo-data ./data
docker build -t memo-myhelloworld ./myHelloWorld
docker build -t memo-jenkins ./jenkins
docker build -t memo-nginx ./nginx
docker build -t memo-registry ./registry

docker run -d \
  -v `pwd`/container_data/jenkins_home:/var/jenkins_home \
  -v `pwd`/container_data/logs/jenkins:/var/log/jenkins \
  -v `pwd`/container_data/logs/nginx:/var/log/nginx \
  -v `pwd`/container_data/registry:/var/lib/registry \
  --name memo-data memo-data

  # -v `pwd`/registry/config.yml:/etc/docker/registry/config.yml \

docker run -d --name memo-myhelloworld memo-myhelloworld

docker run -d --name memo-jenkins --volumes-from=memo-data jenkins

docker run -d --name memo-registry --volumes-from=memo-data memo-registry

docker run -d --name memo-nginx \
  -p 58888:8888 -p 58484:8484 -p 58080:8080 -p 55000:5000 \
  --link memo-myhelloworld:memo-myhelloworld \
  --link memo-jenkins:memo-jenkins \
  --link memo-registry:memo-registry \
  --volumes-from=memo-data memo-nginx



# docker run --name memo-nginx -p 80:8080 -d memo-nginx
# docker run --name memo-registry -p 4567:4567 -d memo-registry
# docker run -d -p 49001:8080 -v $PWD/jenkins:/var/jenkins_home:z -t jenkins
