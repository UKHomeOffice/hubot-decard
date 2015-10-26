FROM node:4.2.1

COPY . /usr/src/decard-hubot

WORKDIR /usr/src/decard-hubot
RUN rm -rf node_modules ; npm install

ENTRYPOINT ["bin/hubot", "-a", "slack"]
CMD []
