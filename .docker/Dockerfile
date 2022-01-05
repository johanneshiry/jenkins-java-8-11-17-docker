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
      linux-headers-amd64 \
      openjfx \ 
      cmake \
      g++ \
      openssl \
      python3-dev \
      gfortran \
      build-essential \
      perl && \
    # compile and add eccodes
    curl https://confluence.ecmwf.int/download/attachments/45757960/eccodes-2.21.0-Source.tar.gz --output eccodes.tar.gz && \
    tar -zxvf eccodes.tar.gz && \
    cd eccodes-2.21.0-Source && \
    mkdir build && cd build && cmake .. && make && ctest && make install && \ 
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
   rm -rf /var/lib/apt/lists/* && \
   # add openjdk17 (provided by adoptium as temurin) 
   curl -L  https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17%2B35/OpenJDK17-jdk_x64_linux_hotspot_17_35.tar.gz --output OpenJDK17-jdk_x64_linux_hotspot_17_35.tar.gz && \
   tar -zxvf OpenJDK17-jdk_x64_linux_hotspot_17_35.tar.gz && \
   mv jdk-17+35 /opt/
# drop back to jenkins user
USER jenkins
