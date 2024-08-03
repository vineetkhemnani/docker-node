FROM ubuntu

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
RUN apt-get upgrade -y
RUN bash /tmp/nodesource_setup.sh
RUN apt-get install -y nodejs
RUN node -v

COPY package.json package.json
COPY package-lock.json package-lock.json
COPY server.js server.js

RUN npm install

ENTRYPOINT [ "node","server.js" ]