# Build stage
FROM jelastic/maven:3.9.8-openjdk-21.0.2-almalinux-9 AS build
COPY . .
RUN mvn clean package -Pprod

# Package stage
FROM openjdk:21-jdk-slim
COPY --from=build /target/*.jar /app/application.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app/application.jar"]