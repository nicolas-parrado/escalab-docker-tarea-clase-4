FROM openjdk:8-jdk-alpine as builder

WORKDIR /build

COPY mvnw .
COPY .mvn ./.mvn
COPY pom.xml .
RUN ./mvnw dependency:go-offline

COPY ./src /build/src
RUN ./mvnw package -DskipTests

FROM openjdk:8-jre-alpine
COPY --from=builder /build/target/*.jar /app/my-app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar", "/app/my-app.jar"]
