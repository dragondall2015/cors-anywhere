# Use Maven to build the project
FROM maven:3.8.5-openjdk-17 as build
WORKDIR /app
COPY . .
RUN mvn clean package

# Use a minimal JDK image to run the application
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/taco-cloud-0.0.1-SNAPSHOT.jar taco.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "taco.jar"]

# Set author label
LABEL authors="youngjun_son"
