#!/bin/bash
VERSION=1.0.0
NAME=ambari-local-base

docker build $PWD/Dockerfile -t $NAME:$VERSION -t $NAME:latest
