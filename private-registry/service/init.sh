#!/bin/bash

cd /vagrant

sudo mkdir -p /etc/docker/certs.d/harbor.local
sudo cp ./ssl/* /etc/docker/certs.d/harbor.local/

sudo cp daemon.json /etc/docker/daemon.json
sudo systemctl restart docker