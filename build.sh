#!/usr/bin/bash

eval $(docker-machine env -u)



for version in "$@"
do
    echo building $version
    pushd $version
    #docker build -t registry.gitlab.com/karsegard/docker-infomaniak:$version .
    docker buildx build -t registry.gitlab.com/karsegard/docker-infomaniak:$version .
    #docker push registry.gitlab.com/karsegard/docker-infomaniak:$version
    popd
done


