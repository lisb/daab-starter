FROM node:10 AS node_modules

WORKDIR /daab
COPY package.json .
RUN npm install


FROM node:10-alpine

MAINTAINER masataka.takeuchi

# set timezone JST
RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV NODE_ENV production
ENV DISABLE_NPM_INSTALL true
ENV HUBOT_ADAPTER=direct

# httpd setting
# ENV PORT 8080
EXPOSE 8080

# hubot files
WORKDIR /daab
COPY --from=node_modules /daab .
COPY external-scripts.json .
COPY bin bin
COPY scripts scripts

RUN sed -i -e 's/^#!\/bin\/bash/#!\/bin\/sh/' bin/hubot

CMD bin/hubot run
