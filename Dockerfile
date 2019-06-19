FROM mykro/java8-jre:latest

ADD docker-build /docker-build

RUN chmod 777 /docker-build

WORKDIR /docker-build

ENTRYPOINT ["java", "-jar","jb-hello-world-0.1.0.jar"] 