FROM ubuntu:14.04
MAINTAINER thomas cuthbert

# Install dependencies

RUN apt-get update -y && \
	apt-get install -y \
		redis-server \
		libpq-dev \
		python-dev \
		python-setuptools \
		build-essential \
		git

# Install python dependencies

RUN easy_install pip

# Depends
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Install trigger

COPY trigger /etc/trigger
WORKDIR /etc/trigger
#RUN python setup.py install
COPY ./conf /conf

# Run tests
COPY ./hosts /tmp/hosts_to_inject
COPY ./tests /tests
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]
