FROM tomcat:8
MAINTAINER Kartheek'sCloud
RUN apt-get update
VOLUME /opt/contvol /usr/local/tomcat/
COPY target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
