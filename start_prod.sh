#!/usr/bin/env bash

docker-compose -f docker-compose.prod.yml down --remove-orphans
docker-compose -f docker-compose.prod.yml up -d --build || exit 1

docker-compose -f docker-compose.prod.yml logs -f
