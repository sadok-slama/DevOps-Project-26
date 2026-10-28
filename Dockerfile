FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN chmod +x mvnw && ./mvnw -B clean verify

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /app/target/spring-petclinic-4.0.0-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
