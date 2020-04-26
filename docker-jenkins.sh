#! /bin/bash -e
DOCKER_USER_GROUP=$(stat -c '%g' /var/run/docker.sock)
echo "Creating Docker User Group: $DOCKER_USER_GROUP"
getent group docker-host && delgroup --quiet docker-host
addgroup -g $DOCKER_USER_GROUP docker-host
addgroup jenkins docker-host
su -s /bin/bash -c "/sbin/tini -- /usr/local/bin/jenkins.sh" jenkins
