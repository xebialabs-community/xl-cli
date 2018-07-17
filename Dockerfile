FROM openjdk:jre-alpine
MAINTAINER XebiaLabs "info@xebialabs.com"

RUN apk --no-cache add wget

ADD resources/command.sh /opt/xld/command.sh

VOLUME /data

RUN wget --progress=dot:giga -O /tmp/xl-deploy-trial-cli.zip https://dist.xebialabs.com/xl-deploy-trial-cli.zip && \
    mkdir -p /opt/xld && \
    unzip /tmp/xl-deploy-trial-cli.zip -d /opt/xld && \
    mv /opt/xld/xl-deploy-*-cli /opt/xld/cli && \
    rm -rf /tmp/xl-deploy-trial-cli.zip

CMD ["sh","-x","/opt/xld/command.sh"]