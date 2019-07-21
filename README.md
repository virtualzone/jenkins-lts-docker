# Jenkins LTS with Docker-in-Docker (DiD)
This image is based on the [official jenkins/jenkins:lts-alpine](https://hub.docker.com/r/jenkins/jenkins/) image and includes a pre-installed Docker in Docker (DiD).

To use it:
* Mount ```/var/run/docker.sock```
* Provide the host's Docker Group ID (GID) via the ```DOCKER_USER_GROUP``` environment variable

Example:
```
docker run 
    -p 8080:8080
    -p 50000:50000 
    -e DOCKER_USER_GROUP=1101
    -v jenkins_home:/var/jenkins_home
    -v /var/run/docker.sock:/var/run/docker.sock:ro
    virtualzone/jenkins-lts-docker
```

Please refer to the [official Jenkins Docker image docs](https://github.com/jenkinsci/docker) for more information.
