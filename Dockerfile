FROM node:20-alpine

WORKDIR /server

COPY server/package*.json ./
RUN npm install   # install both dependencies + devDependencies

COPY server/ ./

RUN npm run build


CMD ["node", "out/main.js"]
