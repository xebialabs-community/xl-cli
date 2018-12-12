FROM alpine:3.8

RUN apk add --no-cache curl

RUN curl --fail-early -o /usr/local/bin/xl https://dist.xebialabs.com/public/xl-cli/8.5.0/linux-amd64/xl && \
    chmod +x /usr/local/bin/xl

RUN curl --fail-early -o /usr/local/bin/wait-for https://raw.githubusercontent.com/eficode/wait-for/master/wait-for && \
    chmod +x /usr/local/bin/wait-for

USER 10001
VOLUME "/data"

ENTRYPOINT /usr/local/bin/wait-for -t 120 $XL_DEPLOY && /usr/local/bin/wait-for -t 120 $XL_RELEASE && /usr/local/bin/xl
