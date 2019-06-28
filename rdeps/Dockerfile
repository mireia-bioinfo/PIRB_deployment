FROM debian:jessie

#LABEL "R latest base image"
LABEL version="rbase-dependencies"
LABEL description="Base image to be used as starting point for the R install"


ADD sources.list /tmp/
WORKDIR /tmp
RUN mv sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
  curl \
  git \
  libpng12-0 \
  libpng12-dev \
  libtiff5 \
  libtiff5-dev \
  libcairo2 \
  libcairo2-dev \
  libglu1-mesa \
  libglu1-mesa-dev \
  zlib1g \
  zlib1g-dev \
  tk8.5-dev \
  libtk8.5 \
  tcl8.5-dev \
  libtcl8.5 \
  libjpeg62-turbo \
  libjpeg-dev \
  libjpeg62-turbo-dev \
  libgfortran3 \
  libgfortran-4.9-dev \
  wget \
  gfortran \
  libreadline6 \
  libreadline-dev \
  libxt-dev \
  libbz2-dev \
  libcurl4-gnutls-dev \
  libmysqlclient-dev \
  libxml2-dev \
  libssl-dev \
  ttf-mscorefonts-installer \
  texlive-fonts-recommended \
  && apt-get clean

## Manage and install fonts
RUN mkdir ~/.local/share/
ADD fonts ~/.local/share/
RUN fc-cache -f -v

###
CMD []
