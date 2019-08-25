FROM python:3.7-alpine
MAINTAINER Delivious Studios.

ENV PYTHONUNBUFFERED 1

# Install dependencies
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# Setup directory structure
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app

RUN adduser -D user
USER user







# Build Commnad docker for ssh connection
# build -t app --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" .
# docker-machine create --driver hyperv appmachine
# docker-machine start appmachine
# docker-machine regenerate-certs appmachine
# Delete commands

# docker rm $(docker ps -a -q)
# docker rmi $(docker images -q)
