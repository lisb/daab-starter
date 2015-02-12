FROM node:latest

MAINTAINER masataka.takeuchi

ENV WD /daab
WORKDIR $WD

# install dependencies
ADD package.json $WD/
RUN npm install

# httpd setting
# ENV PORT 8080
EXPOSE 8080

# hubot files
ADD . $WD/
CMD bin/hubot start && bin/hubot logs

