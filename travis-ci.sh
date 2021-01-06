#!/bin/bash

http --follow https://gist.githubusercontent.com/jdewinne/3f13494858fad8b6b2b88ebd3439f1ea/raw/dce2f06fea89a6038acd6944c516c8be9347c48d/dockertags > ./dockertags
chmod +x dockertags

image_name="xebialabsunsupported/xl-cli"
echo "8.5.0" > /tmp/cli_download
echo "9.5.5" >> /tmp/cli_download
echo "9.6.2" >> /tmp/cli_download
echo "9.7.6" >> /tmp/cli_download
echo "9.8.0" >> /tmp/cli_download
./dockertags -i $image_name >> /tmp/cli_download

sort -u /tmp/cli_download > /tmp/cli_sorted

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
while read tag ; do
    echo "build $image_name:$tag"
    docker build -t $image_name:$tag . --build-arg CLI_VERSION=$tag
    docker push $image_name:$tag
done < /tmp/cli_sorted


echo "done"
