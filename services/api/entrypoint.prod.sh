#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z "$POSTGRES_HOST" "$POSTGRES_PORT"; do
  echo "PostgreSQL not started yet..."
  sleep 1
done

echo "PostgreSQL started"

exec "$@"
