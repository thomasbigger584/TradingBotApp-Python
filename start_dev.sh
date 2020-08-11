#!/usr/bin/env bash

docker-compose down 
docker-compose up -d --build || exit 1

docker-compose logs -f
