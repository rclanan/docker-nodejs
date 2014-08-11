# Dockerfile for node.js
# http://nodejs.org/

FROM debian:jessie
MAINTAINER Ray Clanan <rclanan@utopianconcept.com>

RUN apt-get update && apt-get install --no-install-recommends -y \
  curl \
  git-core

RUN curl -sL https://deb.nodesource.com/setup | bash -

RUN apt-get install --no-install-recommends -y \
  nodejs \
  npm
