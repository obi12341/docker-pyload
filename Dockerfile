FROM ubuntu:14.04
MAINTAINER Patrick Oberdorf "patrick@oberdorf.net"

RUN apt-get update && apt-get install -y python \
	python-pycurl \
	python-crypto \
	tesseract-ocr \
	python-beaker \
	python-imaging \
	unrar-free \
	gocr \
	python-django \
	git
	
RUN git clone https://github.com/pyload/pyload.git /opt/pyload
RUN echo "/opt/pyload/pyload-config" > /opt/pyload/module/config/configdir
ADD pyload-config/ /opt/pyload/pyload-config

EXPOSE 8000
VOLUME /opt/pyload/pyload-config
VOLUME /opt/pyload/Downloads

CMD ["/opt/pyload/pyLoadCore.py"]
