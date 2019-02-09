ARG CLI_VERSION
FROM alpine:3.8

RUN apk add --no-cache curl

RUN curl --fail-early -o /usr/local/bin/xl https://dist.xebialabs.com/public/xl-cli/$CLI_VERSION/linux-amd64/xl && \
    chmod +x /usr/local/bin/xl

RUN curl --fail-early -o /usr/local/bin/wait-for https://raw.githubusercontent.com/eficode/wait-for/master/wait-for && \
    chmod +x /usr/local/bin/wait-for

USER 10001
VOLUME "/data"
ENV XL_DEPLOY xld:4516
ENV XL_RELEASE xlr:5516

ENTRYPOINT ["sh","-c","/usr/local/bin/wait-for $XL_DEPLOY -t 120","&&","sh","-c","/usr/local/bin/wait-for $XL_RELEASE -t 120","&&","/usr/local/bin/xl"]
