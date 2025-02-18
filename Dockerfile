FROM --platform=linux/amd64 eclipse-temurin:17-jdk-alpine-3.20
VOLUME /tmp
COPY build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
