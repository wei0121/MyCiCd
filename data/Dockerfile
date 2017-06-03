FROM debian:jessie
MAINTAINER Maxfield Stewart

# Create the jenkins user
RUN useradd -d "/var/jenkins_home" -u 1000 -m -s /bin/bash jenkins

# Create the folders and volume mount points
RUN mkdir -p /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN mkdir -p /var/log/nginx
RUN mkdir -p /var/lib/registry
VOLUME ["/var/log/jenkins", "/var/jenkins_home", "/var/log/nginx", "/var/lib/registry", ]

USER jenkins
CMD ["echo", "Data container for Jenkins"]
