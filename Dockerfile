FROM jenkins/jenkins:lts-alpine
USER root
RUN apk update && apk add docker
RUN addgroup -g 233 docker-host && \
	addgroup jenkins docker-host
USER jenkins
