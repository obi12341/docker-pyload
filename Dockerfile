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
        git \
        && apt-get clean

RUN git clone https://github.com/pyload/pyload.git /opt/pyload
RUN echo "/opt/pyload/pyload-config" > /opt/pyload/module/config/configdir
ADD pyload-config/ /tmp/pyload-config
ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8000
VOLUME /opt/pyload/pyload-config
VOLUME /opt/pyload/Downloads

CMD ["/run.sh"]
