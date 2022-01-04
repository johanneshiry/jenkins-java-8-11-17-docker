# jenkins-java-8-11-docker
Dockerfile to create a Jenkins CI image with Java 8, Java 11 and Java 17 support incl. installed docker-ce inside the Jenkins container to allow for docker container execution within Jenkins. 
Furthermore, [ecCodes](https://confluence.ecmwf.int/display/ECC) is installed as this is a required dependency for our integration tests in [DWDWeatherTools](https://github.com/ie3-institute/DWDWeatherTools).

## Additional configuration
Depending on your firewall settings and if you want to use docker container inside your jenkins pipeline                             
(e.g. the famous testcontainers library) you might need to adapt your firewall settings to allow jenkins
to connect to container on the same host. The following command adds the required permissions for the       
docker0 interface:

```shell 
sudo ufw allow in on docker0 from 172.17.0.0/16 to 172.17.0.0/16
```
