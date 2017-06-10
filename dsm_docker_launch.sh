mkdir -p /volume1/docker/container_data/jenkins_home
mkdir -p /volume1/docker/container_data/logs/jenkins
mkdir -p /volume1/docker/container_data/logs/nginx
mkdir -p /volume1/docker/container_data/registry

chown 1000:1000 /volume1/docker/container_data/jenkins_home
chown 1000:1000 /volume1/docker/container_data/logs/jenkins
chown 1000:1000 /volume1/docker/container_data/logs/nginx
chown 1000:1000 /volume1/docker/container_data/registry

docker build -t memo-data ./data
docker build -t memo-myhelloworld ./myHelloWorld
docker build -t memo-jenkins ./jenkins
docker build -t memo-nginx ./nginx
docker build -t memo-registry ./registry

docker run -d \
  -v /volume1/docker/container_data/jenkins_home:/var/jenkins_home \
  -v /volume1/docker/container_data/logs/jenkins:/var/log/jenkins \
  -v /volume1/docker/container_data/logs/nginx:/var/log/nginx \
  -v /volume1/docker/container_data/registry:/var/lib/registry \
  --name memo-data memo-data

docker run -d --name memo-myhelloworld memo-myhelloworld

docker run -d --name memo-jenkins --volumes-from=memo-data jenkins

docker run -d --name memo-registry --volumes-from=memo-data memo-registry

docker run -d --name memo-nginx \
  -p 58888:8888 -p 58484:8484 -p 58080:8080 -p 55000:5000 \
  --link memo-myhelloworld:memo-myhelloworld \
  --link memo-jenkins:memo-jenkins \
  --link memo-registry:memo-registry \
  --volumes-from=memo-data memo-nginx
