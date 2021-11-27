FROM ubuntu:16.04

RUN apt-get update && \
  apt-get install -y vim openssh-server expect wget net-tools iproute ipppd iptables curl iputils-ping && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root

COPY ssh_config /etc/ssh/ssh_config
COPY sshd_config /etc/ssh/sshd_config

COPY user.sh /usr/local/bin/user.sh
RUN chmod +x /usr/local/bin/user.sh && \
  /usr/local/bin/user.sh

# Install fortivpn client unofficial .deb
RUN wget 'https://hadler.me/files/forticlient-sslvpn_4.4.2329-1_amd64.deb' -O forticlient-sslvpn_amd64.deb
RUN dpkg -x forticlient-sslvpn_amd64.deb /usr/share/forticlient

# Run setup
RUN /usr/share/forticlient/opt/forticlient-sslvpn/64bit/helper/setup.linux.sh 2

# Copy runfiles
COPY forticlient /usr/bin/forticlient
RUN chmod u+x /usr/bin/forticlient

COPY start.sh /start.sh
RUN chmod u+x /start.sh

CMD [ "/start.sh" ]
