#!/bin/bash

MAVEN_VERSION=3.5.4
USER_HOME_DIR="/root"
SHA=CE50B1C91364CB77EFE3776F756A6D92B76D9038B0A0782F7D53ACF1E997A14D
BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

mkdir -p /usr/share/maven /usr/share/maven/ref 
curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz
echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - 
tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 
rm -f /tmp/apache-maven.tar.gz 
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

export MAVEN_HOME=/usr/share/maven
export MAVEN_CONFIG="${USER_HOME_DIR}/.m2"
