#!/bin/bash

NEW_USER_NAME="admin"
NEW_UID=333

if [ "$AMBARI_USER_NAME" != "" ]; then
  NEW_USER_NAME=$AMBARI_USER_NAME
fi

if [ "$AMBARI_UID" != "" ]; then
  NEW_UID=$AMBARI_UID
fi

adduser $NEW_USER_NAME -u $NEW_UID -g 0 --no-log-init #--no-log-init is helpful if the uid is big(https://stackoverflow.com/questions/48671214/docker-image-size-for-different-user)
passwd -d $NEW_USER_NAME

echo "Ambari user: $NEW_USER_NAME: $NEW_UID has been create"
