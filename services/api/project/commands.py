import click
from faker import Faker

from project.database import db
from project.user.models import User


@click.option('--num_users', default=5, help='Number of users.')
def populate_db(num_users):
    """Populates the database with seed data."""
    fake = Faker()
    users = []
    for _ in range(num_users):
        users.append(
            User(
                username=fake.user_name(),
                email=fake.email(),
                password=fake.word() + fake.word(),
                remote_addr=fake.ipv4()
            )
        )
    users.append(
        User(
            username='admin',
            email='admin@admin.com',
            password='admin',
            remote_addr=fake.ipv4(),
            active=True,
            is_admin=True
        )
    )
    for user in users:
        db.session.add(user)
    db.session.commit()


def create_db():
    print("Creating database")
    """Creates the database."""
    db.create_all()


def drop_db():
    print("Dropping database")
    """Drops the database."""
    db.drop_all()


def recreate_db():
    print("Recreating database")
    """Same as running drop_db() and create_db()."""
    drop_db()
    create_db()
