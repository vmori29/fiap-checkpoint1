FROM maven:3.8.7-openjdk-18-slim AS build

RUN mkdir /opt/checkpoint1

COPY . /opt/checkpoint1

WORKDIR /opt/checkpoint1

RUN mvn clean package

FROM eclipse-temurin:18-jre-alpine

RUN mkdir /opt/checkpoint1

COPY --from=build  /opt/checkpoint1/target/checkpoint1-0.0.1-SNAPSHOT.jar /opt/checkpoint1/checkpoint1-0.0.1-SNAPSHOT.jar

WORKDIR /opt/checkpoint1

ENV PROFILE=dev

EXPOSE 8080

ENTRYPOINT ["java", "-Dspring.profiles.active=${PROFILE}", "-jar", "checkpoint1-0.0.1-SNAPSHOT.jar"]