# Stage 1: Build
FROM eclipse-temurin:17-jdk-focal AS builder
WORKDIR /app

# Copy Maven files
COPY pom.xml .
COPY src src

# Build the Spring Boot JAR, skip tests
RUN apt-get update && apt-get install -y maven \
    && mvn clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jre-focal
WORKDIR /app

# Copy the JAR from builder
COPY --from=builder /app/target/*.jar app.jar

# Expose 8080
EXPOSE 8080

# Run the app
ENTRYPOINT ["java","-jar","app.jar"]
