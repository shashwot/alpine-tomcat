FROM alpine:latest

LABEL maintainer "shashwot@gmail.com"

WORKDIR /opt/

RUN apk update && \
    apk add --no-cache wget && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk && \
    apk add --allow-untrusted /opt/glibc-2.30-r0.apk && \
    wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz && \
    tar -C /opt/ -xvzf /opt/jdk-8u131-linux-x64.tar.gz && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz && \
    tar -C /opt/ -xvzf /opt/apache-tomcat-9.0.30.tar.gz && \
    mv /opt/apache-tomcat-9.0.30 /opt/tomcat && \
    mv /opt/jdk1.8.0_131 /opt/.java && \
    rm -rf /opt/*.tar.gz \
           /opt/*.apk \
           /opt/tomcat/webapps/docs \
           /opt/tomcat/webapps/examples \
           /opt/tomcat/webapps/host-manager \
           /opt/tomcat/webapps/manager \
           /tmp/* /var/cache/apk/*

ENV JAVA_HOME /opt/.java
ENV PATH ${PATH}:${JAVA_HOME}/bin

RUN export PATH

EXPOSE 8080

CMD /opt/tomcat/bin/catalina.sh run
