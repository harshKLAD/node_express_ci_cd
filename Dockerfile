# specify the node base image with your desired version node:<version>
FROM node:16

WORKDIR /usr/src/app

COPY . .

RUN npm install

EXPOSE 3000

CMD [ "node", "app.js" ]
