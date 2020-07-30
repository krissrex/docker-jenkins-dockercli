FROM jenkins/jenkins:lts

USER root

# Versions can be seen in https://download.docker.com/linux/static/stable/x86_64/
# https://docs.docker.com/install/linux/docker-ce/binaries/#install-static-binaries
ENV DOCKERVERSION=19.03.9
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && mv docker-${DOCKERVERSION}.tgz docker.tgz \
  && tar xzvf docker.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker.tgz

# I use this personally. Fork this repo if you don't need this :p
# A trick to run docker-in-docker until AWS ECS supports: `docker run --group-add docker`
# 497 happens to be my ECS docker gid (`getent group docker`)
RUN groupadd -g 497 --non-unique --system docker
RUN usermod -a -G docker jenkins
RUN apt-get update && apt-get install -y rsync

USER jenkins
