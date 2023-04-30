FROM crops/poky:debian-11

USER root

COPY files/sources.list /etc/apt/sources.list

RUN apt-get update &&\
	apt-get install -y --no-install-recommends python3-dev imagemagick ffmpeg sox git curl rsync repo python3-pip libfmt-dev && apt-get clean

ARG KAS_VERSION=2.6.2
RUN pip3 install kas==${KAS_VERSION}

# Add gcc for XCSoar
RUN apt-get install --no-install-recommends -y gcc g++ && apt-get clean

RUN git config --global user.email "build@no-domain" &&\
    git config --global user.name "Buildrobot" &&\
    git config --global color.ui false
