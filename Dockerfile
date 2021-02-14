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
      openjdk-8-jdk \ 
      xvfb \
      openjfx && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y --no-install-recommends install docker-ce && \
   apt-get clean && \
   usermod -aG docker jenkins && \
   rm -rf /var/lib/apt/lists/*

# drop back to jenkins user
USER jenkins
