FROM gradle:8.4-jdk17 AS build
COPY --chown=gradle:gradle . /workspace
WORKDIR /workspace
RUN gradle bootJar -x test

FROM gcr.io/distroless/java17-debian11
COPY --from=build /workspace/build/libs/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
