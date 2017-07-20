FROM ubuntu:xenial
MAINTAINER Patrick Oberdorf "patrick@oberdorf.net"

RUN apt-get update && apt-get install -y python \
	locales \
	python-setuptools \
	python-requests \
	python-pycurl \
	python-crypto \
	python-imaging \
	python-pyxmpp \
	python-jinja2 \
	python-thrift \
	python-feedparser \
	python-beautifulsoup \
	tesseract-ocr \
	python-beaker \
	unrar \
	gocr \
	python-django \
	git \
	rhino \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
VOLUME /opt/pyload/pyload-config
VOLUME /opt/pyload/Downloads

CMD ["/run.sh"]
