# What is this?
This is base image to build Ambari cluster.
It is based on [CentOS](https://hub.docker.com/_/centos)(CentOS 7), and install all prerequisite, setting to run Ambari and so on.

Here is the dependencies that are installed in this image.
- Open JDK 8(`java-1.8.0-openjdk`)
- maven
- GCC-C++
- rpm-build
- openssh server
- openssh client
- chrony

Also It adds Ambari public repository under `/etc/yum.repos.d/` to install Ambari
Currently the Ambari version is [2.7.4.0](https://docs.cloudera.com/HDPDocuments/Ambari-2.7.4.0/bk_ambari-installation/content/ambari_repositories.html)

# How to use this image?
You don't have to use this image. This is base image, so refer [Ambari local cluster](https://github.com/dev-m00n/ambari-local-cluster)

# Where can I put Init scripts?
Basically it executes all script files under `/entry/usr/`. So you may mount directory contains your scripts to there.