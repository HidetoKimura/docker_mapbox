FROM ubuntu:18.04

RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list
RUN apt-get update -y && apt-get upgrade -y 

# Basic commnads
RUN apt-get install -y sudo vim 

ARG DOCKER_UID=9001
ARG DOCKER_GID=9001
ARG DOCKER_USER=user
ARG DOCKER_PASSWORD=user

RUN groupadd --gid ${DOCKER_GID} ${DOCKER_USER}
RUN useradd --create-home --uid ${DOCKER_UID} --gid ${DOCKER_GID} --groups sudo,video    --shell /bin/bash ${DOCKER_USER} \
&& echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

# Mapbox SDK for Qt 
RUN apt-get install -y qt5-default qtwayland5 libcurl4

COPY ./bin/mbgl-qt /usr/local/bin
COPY ./bin/libqmapboxgl.so  /usr/local/lib
RUN ldconfig
ENV QT_WAYLAND_DISABLE_WINDOWDECORATION=1

USER ${DOCKER_USER}
WORKDIR /home/${DOCKER_USER}
CMD mbgl-qt -platform wayland