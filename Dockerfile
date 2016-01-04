FROM hypriot/rpi-python:latest

RUN apt-get update \
	&& apt-get upgrade --force-yes --yes \
	&& apt-get install -y python \
		python-pycurl \
		python-crypto \
		tesseract-ocr \
		python-beaker \
		python-imaging \
		gocr \
		python-django \
		git \
		rhino \
		--no-install-recommends \
	&& apt-get autoremove --force-yes --yes \
	&& apt-get -y autoclean \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ADD unrar_4.1.4-1+deb7u1_armhf.deb /tmp/unrar.deb

RUN dpkg -i /tmp/unrar.deb && rm /tmp/unrar.deb

ADD run.sh /run.sh
RUN git clone https://github.com/pyload/pyload.git /opt/pyload \
	&& echo "/opt/pyload/pyload-config" > /opt/pyload/module/config/configdir \
	&& chmod +x /run.sh
ADD pyload-config/ /tmp/pyload-config

EXPOSE 8000 7227
VOLUME ["/opt/pyload/pyload-config", "/opt/pyload/Downloads"]

CMD ["/run.sh"]
