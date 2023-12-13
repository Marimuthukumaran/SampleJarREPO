FROM eclipse-temurin:17.0.7_7-jdk-focal

# Add a new user "pnp" with user id 8877
RUN useradd -u 8877 pnp

# Create necessary directories and set permissions
RUN mkdir -p /opt/docker/ /templates/ /files/ /tmp && \
    chown -R pnp:pnp /opt /templates /files /tmp

# Change to non-root privilege
USER pnp

# Set jar location
ARG JAR_FILE=target/*.jar

# Copy application jar to app.jar
COPY ${JAR_FILE} app.jar

# Run Command: java -jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
