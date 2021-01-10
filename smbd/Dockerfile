FROM alpine:latest

RUN apk add --no-cache --update \
    samba \
    samba-common-tools \
    supervisor \ 
    && rm -rf /var/cache/apk/* \
    && addgroup -g 1000 user && adduser -D -H -G user -s /bin/false -u 1000 user \
    && echo -e "pass\npass" | smbpasswd -a -s user

VOLUME /shared
WORKDIR /shared

COPY smb.conf /etc/samba/

EXPOSE 137/udp 138/udp 139 445

ENTRYPOINT smbd && /bin/sh
# CMD ["smbd", "--foreground" "--log-stdout"]
