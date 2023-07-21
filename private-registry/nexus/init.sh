#!/bin/bash

cd /vagrant

docker volume create nexus-data
docker compose up -d