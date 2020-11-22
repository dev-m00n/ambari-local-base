FROM centos:centos7

ARG AMBARI_VERSION="2.7.4.0"

LABEL maintainer="devlog.moonduck@gmail.com" 

# Install required dependencies to install ambari
RUN yum clean all -y && yum install -y "java-1.8.0-openjdk" "maven" "gcc-c++" "rpm-build" "openssh-server" "openssh-clients" "chrony" "rpcbind" && yum clean all -y && rm -rf /var/cache/yum 

# Add Ambari in yum repository
RUN curl "http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/$AMBARI_VERSION/ambari.repo" -o /etc/yum.repos.d/ambari.repo

ENV container docker

RUN ssh-keygen -A

#Make systemctl work
COPY systemctl /usr/bin/systemctl
RUN chmod 555 /usr/bin/systemctl

#Make chronyd work
COPY chronyd.service /usr/lib/systemd/system/chronyd.service 

#Create directory for user defined scripts
RUN mkdir -p /entry/usr && mkdir /entry/init
COPY scripts/run.sh /entry
COPY scripts/add_admin.sh /entry/init

ENTRYPOINT [ "/entry/run.sh" ]
