FROM jenkins/jenkins:lts

USER root

# Versions can be seen in https://download.docker.com/linux/static/stable/x86_64/
# https://docs.docker.com/install/linux/docker-ce/binaries/#install-static-binaries
ENV DOCKERVERSION=18.06.1-ce
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && mv docker-${DOCKERVERSION}.tgz docker.tgz \
  && tar xzvf docker.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker.tgz

# I use this personally. Fork this repo if you don't need this :p
RUN apt update && apt install -y rsync

USER jenkins
