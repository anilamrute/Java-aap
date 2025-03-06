FROM maven:3.8.6-openjdk-11 AS build

WORKDIR /app

COPY pom.xml .

RUN mvn clean package

FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build /app/target/calculator-app-1.0-SNAPSHOT.jar /app/calculator-app.jar


ENTRYPOINT ["java", "-jar", "/app/calculator-app.jar"]
