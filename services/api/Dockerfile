# pull official base image
FROM python:3.8.1-slim-buster

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /usr/src/app

# install system dependencies
RUN apt-get update && apt-get install -y netcat curl

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt
RUN find . -name '*.pyc' -delete

# copy project
COPY . /usr/src/app/
RUN yarn install --modules-folder ./project/static/node_modules

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
