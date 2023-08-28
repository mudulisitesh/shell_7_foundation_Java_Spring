FROM maven:3.6.3-openjdk-17-slim AS build

WORKDIR /app

COPY pom.xml
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn package

FROM openjdk.17-slim

WORKDIR /app

COPY --from=build /app/target/shell_7_foundation_Java_Spring.jar

CMD ["java", "-jar", "shell_7_foundation_Java_Spring.jar"]
