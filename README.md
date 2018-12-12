# xl-cli

Docker image that has XL CLI installed.

## CI status

[![Docker Hub][xl-cli-docker-hub-image] ][xl-cli-docker-hub-url]
[![License: MIT][xl-cli-license-image] ][xl-cli-license-url]


[xl-cli-docker-hub-image]: https://img.shields.io/badge/docker-ready-blue.svg
[xl-cli-docker-hub-url]: https://registry.hub.docker.com/u/xebialabsunsupported/xl-cli/
[xl-cli-license-image]: https://img.shields.io/badge/License-MIT-yellow.svg
[xl-cli-license-url]: https://opensource.org/licenses/MIT



## Supported tags

+ `8.5.0` [Dockerfile](https://github.com/xebialabs-community/xl-cli/blob/master/Dockerfile)

## Dockerfile
+ `Dockerfile` builds the container with base image `alpine`

## Usage

For example will print the xl cli help message:

```
    docker run -e XL_DEPLOY=172.17.0.1:4516 -e XL_RELEASE=172.17.0.1:5516 xebialabsunsupported/xl-cli:8.5.0
```