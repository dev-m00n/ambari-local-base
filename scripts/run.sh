#!/bin/bash

SCRIPT_HOME="/entry"

for file in `ls $SCRIPT_HOME/init`; do
  file_path="$SCRIPT_HOME/init/$file"
  echo "Running $file_path"
  /bin/bash $file_path
done

for file in `ls $SCRIPT_HOME/usr`; do
  file_path="$SCRIPT_HOME/usr/$file"
  echo "Running $file_path"
  /bin/bash $file_path
done

exec systemctl
