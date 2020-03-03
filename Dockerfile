FROM alpine:latest

LABEL maintainer "shashwot@gmail.com"

COPY jdk-8u231-linux-x64.tar.gz /opt/
COPY glibc-2.30-r0.apk /tmp/ 

RUN apk add --allow-untrusted /tmp/*.apk && \
    tar -C /opt/ -xvzf /opt/jdk-8u231-linux-x64.tar.gz && \
    mv /opt/jdk1.8.0_231 /opt/.java && \
    rm -rf /opt/*.tar.gz \
           /opt/.java/jre/plugin \
           /opt/.java/jre/bin/javaws \
           /opt/.java/jre/bin/orbd \
           /opt/.java/jre/bin/pack200 \
           /opt/.java/jre/bin/policytool \
           /opt/.java/jre/bin/rmid \
           /opt/.java/jre/bin/rmiregistry \
           /opt/.java/jre/bin/servertool \
           /opt/.java/jre/bin/tnameserv \
           /opt/.java/jre/bin/unpack200 \
           /opt/.java/jre/lib/javaws.jar \
           /opt/.java/jre/lib/deploy* \
           /opt/.java/jre/lib/desktop \
           /opt/.java/jre/lib/*javafx* \
           /opt/.java/jre/lib/*jfx* \
           /opt/.java/jre/lib/amd64/libdecora_sse.so \
           /opt/.java/jre/lib/amd64/libprism_*.so \
           /opt/.java/jre/lib/amd64/libfxplugins.so \
           /opt/.java/jre/lib/amd64/libglass.so \
           /opt/.java/jre/lib/amd64/libgstreamer-lite.so \
           /opt/.java/jre/lib/amd64/libjavafx*.so \
           /opt/.java/jre/lib/amd64/libjfx*.so \
           /opt/.java/jre/lib/ext/jfxrt.jar \
           /opt/.java/jre/lib/oblique-fonts \
           /opt/.java/jre/lib/plugin.jar \
           /tmp/* /var/cache/apk/* 


# Set environment
ENV JAVA_HOME /opt/.java

ENV PATH ${PATH}:${JAVA_HOME}/bin

RUN export PATH
