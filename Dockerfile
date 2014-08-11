# Dockerfile for node.js
# http://nodejs.org/

FROM debian:jessie
MAINTAINER Ray Clanan <rclanan@utopianconcept.com>

RUN apt-get update && apt-get upgrade -y && apt-get install --no-install-recommends -y \
  build-essential \
  software-properties-common \
  curl \
  wget \
  unzip \
  git-core \
  python \
  python-dev \
  python-pip \
  python-virtualenv

# Install node.js
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bash_profile

RUN npm install -g bower grunt-cli

VOLUME ["/data"]

WORKDIR /data

CMD ["bash"]
