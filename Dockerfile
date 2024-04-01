FROM maven:3.8.6-jdk-11 as maven

COPY . .
RUN mvn package


FROM openjdk:17-jdk-slim

ARG VERSION
ENV APP="/target/my-app-$VERSION.jar"
COPY --from=maven /target/my-app-$VERSION.jar .
CMD java -jar $APP
