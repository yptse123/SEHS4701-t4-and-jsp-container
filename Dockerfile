FROM openjdk:17-jdk-slim AS build
WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Check if the JVM recognizes the -XX:UseSVE=0 option and set JAVA_TOOL_OPTIONS accordingly
RUN java -XX:+PrintFlagsFinal -version 2>&1 | grep -q 'UseSVE' && \
    echo "export JAVA_TOOL_OPTIONS=\"-XX:UseSVE=0\"" >> /etc/profile.d/javatooloptions.sh || \
    echo "export JAVA_TOOL_OPTIONS=\"\"" >> /etc/profile.d/javatooloptions.sh

COPY pom.xml .
COPY src ./src

# Run Maven to build the project
RUN mvn clean package


FROM tomcat:10.0
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]