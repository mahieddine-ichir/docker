# Dockerfile CI
A Git repository for building a Docker image for a complete Continous Integration server.

## Version
This image is still in its verion 0, i.e. still under construction.

## Content
This image is built on the openjdk (v7) image.
It aims to build an image that contains:

* *git* command line client
* *apache maven 3.3.3* installation (in /usr/share/maven/apache-maven-3.3.3)
* *jenkins 1.611* continous integration server (in /usr/share/jenkins-1.611). Jenkins is configured to listen to port 8080.
The JENKINS_HOME is located on /var/jenkin_home
* *sonar_cube* TODO



