# Build stage
FROM maven:3.9.7-eclipse-temurin-21-alpine AS build
COPY . .
RUN mvn clean package

# Package stage
FROM openjdk:21-jdk-slim
COPY --from=build /target/*.jar /app/application.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app/application.jar"]