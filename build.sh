#!/usr/bin/bash

eval $(docker-machine env -u)



for version in "$@"
do
    pushd $version
    docker build -t registry.gitlab.com/karsegard/docker-infomaniak:$version .
    docker push registry.gitlab.com/karsegard/docker-infomaniak:$version
    popd
done


