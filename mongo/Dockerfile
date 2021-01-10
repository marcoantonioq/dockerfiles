FROM alpine:latest

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories && \
    echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositorie && \
    apk update && apk --no-cache --update add openjdk11 && apk --no-cache --update add mongodb

VOLUME /data/db

COPY run.sh /root

WORKDIR /data

EXPOSE 27017 28017

ENTRYPOINT [ "/root/run.sh" ]
# CMD [ "mongod", "--bind_ip", "0.0.0.0" ]