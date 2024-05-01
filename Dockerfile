FROM maven:3.8.1-openjdk-8 as builder
COPY . /usr/src/app
WORKDIR /usr/src/app
ARG SKIP_TEST
RUN mvn clean install $SKIP_TEST
FROM openjdk:8-jre-alpine
COPY --from=builder /usr/src/app/target/*.jar /usr/app/app.jar
WORKDIR /usr/app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
