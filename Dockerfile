FROM node:12-alpine

LABEL "com.github.actions.name"="Post Slack messages"
LABEL "com.github.actions.description"="Post Slack messages from your own bot"
LABEL "com.github.actions.icon"="hash"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.0.5"
LABEL repository="http://github.com/pullreminders/slack-action"
LABEL homepage="http://github.com/pullreminders/slack-action"
LABEL maintainer="Abi Noda <abi@pullreminders.com>"

RUN mkdir /workdir
WORKDIR /workdir

ADD package.json package.json
ADD package-lock.json package-lock.json

RUN npm install

ADD index.js index.js

ADD entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
