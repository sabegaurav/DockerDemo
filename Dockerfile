FROM openjdk:28-ea-oraclelinux10

COPY target/Docker-Demo.jar /Docker-Demo.jar

ENTRYPOINT ["java", "-jar", "/Docker-Demo.jar"]