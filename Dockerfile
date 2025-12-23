FROM maven:3.9.6-eclipse-temurin-17 AS build

RUN mkdir /app

WORKDIR /app

COPY . /app

RUN mvn clean package

FROM tomcat:latest

COPY --from=build /app/webapp/target/webapp.war /usr/local/tomcat/webapps/webapp.war
