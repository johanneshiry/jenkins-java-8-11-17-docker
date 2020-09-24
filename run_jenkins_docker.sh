docker container run --name jenkins-lts-jdk11 --rm --detach -v jenkins-data:/var/jenkins_home -v jenkins-docker-certs:/certs/client:ro -v /var/run/docker.sock:/var/run/docker.sock -p 127.0.0.1:8085:8080 -p 127.0.0.1:50000:50000 jenkins:2.249.1-lts-jdk11-jdk8 --prefix=/ci

