# base image
FROM jenkins/jenkins:lts-jdk11

USER root 

# Install the latest Docker CE binaries, add user `jenkins` to the docker group and install openjdk 8
RUN apt-get update && \
    apt-get -y --no-install-recommends install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common \
      xvfb \
      openjfx && \
    # add docker and openjdk8 repo (debian buster comes w/o openjdk8)
    curl -L https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
	add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y --no-install-recommends install docker-ce adoptopenjdk-8-hotspot && \
   apt-get clean && \
   usermod -aG docker jenkins && \
   rm -rf /var/lib/apt/lists/*

# drop back to jenkins user
USER jenkins