FROM ubuntu

RUN apt-get -y update 
RUN apt-get -y install openjdk-8-jdk wget

WORKDIR /opt
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.84/bin/apache-tomcat-9.0.84.tar.gz
RUN tar xvfz apache-tomcat-9.0.84.tar.gz
RUN mv apache-tomcat-9.0.84 tomcat
COPY target/welcomeapp.war /opt/tomcat/webapps/

EXPOSE 8080
CMD /opt/tomcat/bin/catalina.sh run
