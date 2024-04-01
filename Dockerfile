FROM maven:3.8.6-jdk-11 as maven

ARG VERSION
COPY . .
RUN mvn package

RUN ls

FROM openjdk:17-jdk-slim

ARG VERSION
COPY --from=maven /target/App-$VERSION.jar .
CMD java -jar *.jar
