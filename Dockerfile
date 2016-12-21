FROM ubuntu:16.04

ENV CXX=g++-6

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:ubuntu-wine/ppa \
    && dpkg --add-architecture i386 \
    && add-apt-repository ppa:ubuntu-toolchain-r/test \
    && echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y msitools nodejs npm gcc-6 g++-6 wine wine-gecko git hfsprogs wixl \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get remove -y --auto-remove software-properties-common \
    && npm config set registry http://registry.npmjs.org/ \
    && npm config set spin false \
    && npm install -g bower phantomjs-prebuilt ember-cli
