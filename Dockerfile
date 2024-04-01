FROM maven:3.8.6-jdk-11 as maven

COPY . .
RUN mvn package

RUN ls target

FROM openjdk:17-jdk-slim

COPY --from=maven /target/App.jar .
CMD java -jar *.jar
