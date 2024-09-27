FROM eclipse-temurin:17-jre

# Copy the built application JAR file into the root directory of the container.
# The JAR file contains your Spring Boot or Java application.
ADD build/libs/app.jar /app.jar

# Copy the OpenTelemetry Java agent into the root directory of the container.
# This agent is responsible for automatically collecting and exporting telemetry data such as traces and metrics.
ADD build/agent/opentelemetry-javaagent.jar /opentelemetry-javaagent.jar

# Define the command that will run when the container starts.
# The '-javaagent' option loads the OpenTelemetry Java agent to instrument the application for observability.
# The '-jar' option runs your Spring Boot or Java application.
ENTRYPOINT java -javaagent:/opentelemetry-javaagent.jar -jar /app.jar
