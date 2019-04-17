# Dockerfile for git-bridge

FROM maven:3-jdk-8

WORKDIR /app

COPY . /app
RUN mvn clean package \
# The name of the created jar contains the current version tag.
# Rename it to a static path that can be used for copying.
&&  find /app/target \
      -name 'writelatex-git-bridge*jar-with-dependencies.jar' \
      -exec mv {} /git-bridge.jar \;

FROM openjdk:8-jre

USER www-data

ENTRYPOINT ["java", "-jar", "/git-bridge.jar"]
CMD ["/conf/runtime.json"]

COPY --from=0 /git-bridge.jar /
