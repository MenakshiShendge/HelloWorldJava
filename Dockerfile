FROM maven:3.6.3-openjdk-11-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Maven project files into the container
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean install

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "target/your-application.jar"]
