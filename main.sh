#!/bin/bash

# update database
apt-get update

# setup timesyncd 
apt install -y systemd-timesyncd

# install sth
apt install -y mosh git unzip jq sudo 

# install fish
apt install -y fish
chsh -s /usr/bin/fish

# install nexttrace
curl -fsSL https://github.com/nxtrace/nexttrace-debs/releases/latest/download/nexttrace-archive-keyring.gpg | tee /etc/apt/keyrings/nexttrace.gpg > /dev/null
echo "Types: deb
URIs: https://github.com/nxtrace/nexttrace-debs/releases/latest/download/
Suites: ./
Signed-By: /etc/apt/keyrings/nexttrace.gpg" | tee /etc/apt/sources.list.d/nexttrace.sources > /dev/null
apt update
apt install nexttrace

# setup ssh3
# wget https://github.com/francoismichel/ssh3/releases/download/v0.1.7/ssh3_0.1.7_linux_x86_64.tar.gz -o /tmp/ssh3.tar.gz
# tar -xvf /tmp/ssh3.tar.gz -C /usr/local/bin ssh3 ssh3-server
# rm /tmp/ssh3.tar.gz
# chmod +x /usr/local/bin/ssh3 /usr/local/bin/ssh3-server
# mkdir -p /etc/ssh3/cert/
# openssl req -x509 -sha256 -nodes -newkey rsa:4096 -keyout /etc/ssh3/cert/priv.key -days 3660 -out /etc/ssh3/cert/cert.pem -subj "/C=XX/O=Default Company/OU=XX/CN=selfsigned.ssh3" -addext "subjectAltName = DNS:selfsigned.ssh3,DNS:*"
# wget https://raw.githubusercontent.om/kobe-koto/alice-ephemera-bootup-scripts/main/ssh3-server.service -O /etc/systemd/system/ssh3-server.service
# systemctl daemon-reload
# systemctl enable --now ssh3-server
# ssh3-server -cert /etc/ssh3/cert/cert.pem -key /etc/ssh3/cert/priv.key -bind "[::]:44353"
# ssh3 -insecure -privkey .ssh/id_ed25519 root@<IP>:44353/ssh3-term
