FROM openjdk:17-jdk-slim AS build
WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set JAVA_TOOL_OPTIONS to disable SVE
ENV JAVA_TOOL_OPTIONS="-XX:UseSVE=0"

COPY pom.xml .
COPY src ./src

# Run Maven to build the project
RUN mvn clean package


FROM tomcat:10.0
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]