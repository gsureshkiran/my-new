#FROM alpine/git as clone
#MAINTAINER stangella<stangella9@gmail.com>
#WORKDIR /app
#RUN git clone https://github.com/gsureshkiran/my-new.git
# stage-two
#FROM maven:3.5-jdk-8-alpine as build
#WORKDIR /app
#COPY --from=clone  /app/my-new  /app
#RUN mvn package
# stage-third
FROM tomcat:7-jre7

ADD tomcat-users.xml /usr/local/tomcat/conf
#COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar /usr/local/tomcat/webapps
COPY target/*.jar /usr/local/tomcat/webapps
