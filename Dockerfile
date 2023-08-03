FROM node:18-alpine

COPY server.js /home/ubuntu/Dev-Ops-CW2
COPY package*.json /home/ubuntu/Dev-Ops-CW2

EXPOSE 8080

CMD ["node", "server.js"]
