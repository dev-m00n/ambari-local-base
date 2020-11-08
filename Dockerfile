FROM centos:centos7

ARG AMBARI_VERSION="2.7.4.0"
#ARG ADMIN_UID=1000
#ARG ADMIN_UNAME="mhyun"

LABEL maintainer="devlog.moonduck@gmail.com" 

# Install required dependencies to install ambari
RUN yum clean all -y && yum install -y "java-1.8.0-openjdk" "maven" "gcc-c++" "rpm-build" "openssh-server" "openssh-clients" && yum clean all -y && rm -rf /var/cache/yum 

# Add Ambari in yum repository
RUN curl "http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/$AMBARI_VERSION/ambari.repo" -o /etc/yum.repos.d/ambari.repo

ENV container docker

#Make systemctl work
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN ssh-keygen -A

#RUN adduser $ADMIN_UNAME -u $ADMIN_UID -g 0 && passwd -d $ADMIN_UNAME

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
