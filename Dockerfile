FROM centos:centos7

ARG AMBARI_VERSION="2.7.4.0"

# Install required dependencies to install ambari
RUN yum clean all && yum install -y "java-1.8.0-openjdk" "maven" "gcc-c++" "rpm-build" "openssh-server" "openssh-clients" && yum clean all 

# Add Ambari in yum repository
RUN curl "http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/$AMBARI_VERSION/ambari.repo" -o /etc/yum.repos.d/ambari.repo

