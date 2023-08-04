FROM node:6.14.2

COPY server.js .
COPY package*.json .

EXPOSE 8080

CMD node server.js
