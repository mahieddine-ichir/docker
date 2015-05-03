FROM java:openjdk-7u65-jdk
MAINTAINER Mahieddine ICHIR

# Git
RUN apt-get update
RUN apt-get install -y git

# maven (v 3.3.3)
ENV MAVEN_HOME /usr/share/maven/apache-maven-3.3.3/

RUN mkdir -p /usr/share/maven/

#RUN curl -L http://mirrors.ircam.fr/pub/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz -o /tmp/apache-maven-3.3.3-bin.tar.gz 
COPY apache-maven-3.3.3-bin.tar.gz /tmp/
RUN tar xfz /tmp/apache-maven-3.3.3-bin.tar.gz -C /usr/share/maven/
RUN ls -l $MAVEN_HOME

# jenkins (1.611)
ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_INSTALL /usr/share/jenkins/1.611
ENV JENKINS_PORT 8080

RUN mkdir -p "$JENKINS_HOME"
RUN mkdir -p "$JENKINS_INSTALL"

#RUN curl -L http://mirrors.jenkins-ci.org/war-stable/1.611/jenkins.war -o "$JENKINS_INSTALL/jenkins.war"
COPY jenkins-1.611.war "$JENKINS_INSTALL/jenkins.war"
RUN ls -l $JENKINS_HOME

EXPOSE "$JENKINS_PORT"

# sonar qube

# Mount volumes
VOLUME /usr/share

# Entrypoint
ENTRYPOINT java -jar "$JENKINS_INSTALL/jenkins.war" -httpPort=$JENKINS_PORT

