#!/bin/bash

set -e

CONTAINER_NAME=$1
ORIGIN_URL=$2
FOLDER=$3

CONTAINER_EXISTS=`docker images | awk '{print $1}' |  grep -w -q ${CONTAINER_NAME} && echo "YES" || echo "NO"`

if [ "$CONTAINER_EXISTS" == "NO" ] 
then
    echo "Building ${CONTAINER_NAME}"
    set -x
    cd ~
    mkdir git-repo
    cd git-repo
    git init
    git remote add -f origin ${ORIGIN_URL}
    git config core.sparseCheckout true
    echo ${FOLDER} >> .git/info/sparse-checkout
    git pull origin master
    cd ${FOLDER}
    docker build -t ${CONTAINER_NAME} .
    { set +x; } 2>/dev/null
    echo "${CONTAINER_NAME} was build and saved in local storage"
else
    echo "${CONTAINER_NAME} was found in local storage";
fi

{ set +e; } 2>/dev/null
