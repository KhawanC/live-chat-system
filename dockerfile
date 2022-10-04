FROM node:16.17.1-alpine as node-image
WORKDIR /app
COPY ./front-client .
RUN npm install --silent
CMD ["npm", "start"]

FROM adoptopenjdk/openjdk11:alpine as java-image
ARG JAR_FILE=./back-client/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
