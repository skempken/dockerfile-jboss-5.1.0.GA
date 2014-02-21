FROM ubuntu:latest
MAINTAINER Sebastian Kempken, mail@sebastian-kempken.de

# Update to latest
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install basics
RUN apt-get install -y python-software-properties software-properties-common unzip

# Install Java, auto-accepting the license
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

# Install JBoss 5.1.0.GA
RUN wget -O jboss.zip http://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA-jdk6.zip/download
RUN unzip jboss.zip && mv jboss-5.1.0.GA /opt
RUN cd /opt/jboss-5.1.0.GA/bin && chmod +x *.sh