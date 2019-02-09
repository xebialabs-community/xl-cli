FROM alpine:3.8
ARG CLI_VERSION
RUN apk add --no-cache curl

RUN curl --fail-early -o /usr/local/bin/xl https://dist.xebialabs.com/public/xl-cli/$CLI_VERSION/linux-amd64/xl && \
    chmod +x /usr/local/bin/xl

RUN curl --fail-early -o /usr/local/bin/wait-for https://raw.githubusercontent.com/eficode/wait-for/master/wait-for && \
    chmod +x /usr/local/bin/wait-for

ENV XL_DEPLOY xld:4516
ENV XL_RELEASE xlr:5516
COPY docker-entrypoint.sh /usr/local/bin/

USER 10001
VOLUME "/data"


ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]