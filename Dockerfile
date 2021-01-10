FROM ubuntu:bionic
MAINTAINER Patrick Oberdorf "patrick@oberdorf.net"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y python \
	locales \
	python-setuptools \
	python-requests \
	python-pycurl \
	python-crypto \
	python-pil \
	python-pyxmpp \
	python-jinja2 \
	python-thrift \
	python-feedparser \
	python-beautifulsoup \
	python-pip \
	tesseract-ocr \
	python-beaker \
	p7zip-full \
	p7zip-rar \
	curl \
	gocr \
	python-django \
	git \
	rhino \
	gosu \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& pip install Send2Trash

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN git clone https://github.com/pyload/pyload.git /opt/pyload \
        && cd /opt/pyload \
        && git checkout stable \
        && echo "/opt/pyload/pyload-config" > /opt/pyload/module/config/configdir

ADD pyload-config/ /tmp/pyload-config
ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8000
EXPOSE 9666
EXPOSE 7227
VOLUME /opt/pyload/pyload-config
VOLUME /opt/pyload/Downloads

HEALTHCHECK CMD curl --fail http://localhost:8000/ || exit 1
CMD ["/run.sh"]
