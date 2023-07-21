#!/bin/bash

cd /vagrant

sudo gpg --keyserver hkps://keyserver.ubuntu.com --receive-keys 644FF454C0B4115C

curl -LO https://github.com/goharbor/harbor/releases/download/v2.8.2/harbor-online-installer-v2.8.2.tgz
tar xvf harbor-online-installer-v2.8.2.tgz

cd ssl
sudo mkdir -p /data/cert /etc/docker/certs.d/harbor.local
sudo cp harbor.key harbor.crt /data/cert/
sudo cp ca.crt harbor.cert harbor.key /etc/docker/certs.d/harbor.local/

cd ../harbor
cp ../harbor.yml .

./prepare

docker compose up -d