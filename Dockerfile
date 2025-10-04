# Stage 1: Build the Spring Boot app
FROM eclipse-temurin:17-jdk-focal AS builder

# Set workdir
WORKDIR /app

# Copy Maven wrapper if you have it (optional)
COPY mvnw .
COPY .mvn .mvn

# Copy pom first to leverage Docker cache
COPY pom.xml .

# Copy source code
COPY src src

# Make mvnw executable (if using wrapper)
RUN chmod +x mvnw

# Build the JAR without running tests
RUN ./mvnw clean package -DskipTests

# Stage 2: Create lightweight runtime image
FROM eclipse-temurin:17-jre-focal

WORKDIR /app

# Copy the built jar from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose Render default port 8080
EXPOSE 8080

# Command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
