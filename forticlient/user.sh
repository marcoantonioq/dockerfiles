#!/bin/bash
set -e
 
printf "\n\033[0;44m---> Creating SSH master user.\033[0m\n"
 
useradd -m -d /home/myuser -G ssh myuser -s /bin/bash
echo "myuser:123456" | chpasswd
echo 'PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin"' >> /home/myuser/.profile
 
echo "myuser ALL=NOPASSWD:/bin/rm" >> /etc/sudoers
echo "myuser ALL=NOPASSWD:/bin/mkdir" >> /etc/sudoers
echo "myuser ALL=NOPASSWD:/bin/chown" >> /etc/sudoers
echo "myuser ALL=NOPASSWD:/usr/sbin/useradd" >> /etc/sudoers
echo "myuser ALL=NOPASSWD:/usr/sbin/deluser" >> /etc/sudoers
echo "myuser ALL=NOPASSWD:/usr/sbin/chpasswd" >> /etc/sudoers
 
exec "$@"