#!/bin/bash
apt-get update -y
apt-get install rustc cargo make libpcre3 libpcre3-dbg libpcre3-dev build-essential autoconf automake libtool libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev libjansson4 pkg-config -y
apt-get install libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev libnfnetlink0 -y
apt-get install python3-pip -y
pip3 install --upgrade suricata-update
ln -s /usr/local/bin/suricata-update /usr/bin/suricata-update
wget https://www.openinfosecfoundation.org/download/suricata-5.0.3.tar.gz
tar -xvzf suricata-5.0.3.tar.gz
cd suricata-5.0.3
./configure --enable-nfqueue --prefix=/usr --sysconfdir=/etc --localstatedir=/var
make
make install-full
make install-rules

