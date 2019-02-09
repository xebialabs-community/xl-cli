#!/bin/bash

http --follow https://gist.githubusercontent.com/jdewinne/3f13494858fad8b6b2b88ebd3439f1ea/raw/dce2f06fea89a6038acd6944c516c8be9347c48d/dockertags > ./dockertags
chmod +x dockertags

image_name="xebialabsunsupported/xl-cli"
echo "8.5.0" > /tmp/cli_download
./dockertags -i $image_name > /tmp/cli

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
while read tag ; do
    docker build -t $image_name:$tag . --build-arg CLI_VERSION=$tag
    docker push $image_name:$tag
done < <(comm -23 <(sort /tmp/cli_download) <(sort /tmp/cli))
