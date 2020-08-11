# Trading Bot App

https://medium.com/@yakko.majuri/a-step-by-step-guide-to-building-a-trading-bot-in-any-programming-language-d202ffe91569

https://apscheduler.readthedocs.io/en/stable/userguide.html



Create prod db:
docker-compose -f docker-compose.prod.yml exec api python manage.py create_db

View db:
docker-compose exec db psql --username=hello_flask --dbname=hello_flask_dev