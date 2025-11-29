#FROM ubuntu:20.04
#RUN apt-get update && apt-get -y install build-essential && mkdir –p /app
#COPY . /app/
#WORKDIR /app/
#CMD make

FROM node:18-alpine
WORKDIR /app
# 1. package.json 복사 (캐싱을 위해)
COPY package.json package-lock.json ./ 
# 2. 의존성 설치
RUN npm install 
# 3. 나머지 파일 복사
COPY . .
CMD ["npm", "start"]
