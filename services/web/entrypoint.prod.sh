#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      echo "PostgreSQL not started yet..."
      sleep 1
    done

    echo "PostgreSQL started"
fi

exec "$@"
