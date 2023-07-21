#!/bin/bash

# make xfs filesystem
sudo mkdir -p /mnt/disk1 /mnt/disk2

sudo mkfs.xfs /dev/sdc -L DISK1
sudo mkfs.xfs /dev/sdd -L DISK2

echo -e "LABEL=DISK1\t/mnt/disk1\txfs\tdefaults,noatime\t0\t2" | sudo tee -a /etc/fstab
echo -e "LABEL=DISK2\t/mnt/disk2\txfs\tdefaults,noatime\t0\t2" | sudo tee -a /etc/fstab

sudo mount -a

cd /vagrant
docker compose up -d