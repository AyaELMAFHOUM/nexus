FROM maven:3.8.5-openjdk-17 AS maven_build

COPY pom.xml /tmp/
COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn package
RUN ls -l /tmp/target/

#pull base image
FROM eclipse-temurin:17

#maintainer
MAINTAINER dstar55@yahoo.com

#expose port 8080
EXPOSE 8080

#default command
CMD java -jar /data/hello-world-0.1.0.jar

#copy hello world to docker image from builder image
COPY target/hello-world-0.0.1-SNAPSHOT.jar /data/hello-world-0.1.0.jar

