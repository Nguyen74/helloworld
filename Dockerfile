# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "nguyen_nguyen@hcl.com" 

COPY /webapp/target/*.war /usr/local/tomcat/webapps

EXPOSE 8080
