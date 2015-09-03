# The image is based on the Debian Wheezy distribution.
FROM google/debian:wheezy

# Fetch and install dependencies
RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates

# set latest (at the moment) iojs version
ENV IOJS_VERSION v3.2.0

# this command could be use to find latest version
# `curl -s -L https://iojs.org/dist | sed -n -r 's/^.*(v([0-9]\.?)+).*$/\1/p' | sort -r | head -1`

RUN curl https://iojs.org/dist/v3.2.0/iojs-${IOJS_VERSION}-linux-x64.tar.xz | tar xJ
RUN mv iojs-${IOJS_VERSION}-linux-x64 iojs

# Add iojs installation to PATH, and set
# the current working directory to /app
# so future commands in this Dockerfile are easier to write
ENV PATH $PATH:/iojs/bin/

WORKDIR /app

# Copy the file package.json from your app's /app directory to the Docker
# image. (See note below regarding image caching and dependencies.)
COPY package.json /app/

# Run npm (node’s package manager) to install packages specified in
# package.json
RUN npm install

# COPY the rest of the application source. Since this is a node.js app
COPY . /app

# No further source transformations are performed.
# It is possible to install and run additional tooling such as CSS
# minifiers.
# Specify that npm start is the process that will run in the Docker container. The app should listen on port 8080.
ENTRYPOINT ["/iojs/bin/npm", "start"]
