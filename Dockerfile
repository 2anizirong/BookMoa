#FROM ubuntu:20.04
#RUN apt-get update && apt-get -y install build-essential && mkdir –p /app
#COPY . /app/
#WORKDIR /app/
#CMD make

FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]

