# alpine-tomcat
Contains Java Jdk 1.8 with Tomcat 9.0.30


Tomcat with Java Jdk 1.8

Download the jdk-8u231-linux-x64.tar.gz from : https://www.oracle.com/java/technologies/javase-jdk8-downloads.html

Download the glibc-2.30-r0.apk from : https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk

Download tomcat from : https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/

Copy the downloaded Files to the location where the Dockerfile is created.

docker build -t name:tag .
