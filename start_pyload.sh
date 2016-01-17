#!/bin/bash

docker run -d -p 8001:8000 -p 7227:7227 -v /opt/pyload/downloads:/opt/pyload/Downloads -v /opt/pyload/config:/opt/pyload/pyload-config --name pyload dastrasmue/rpi-pyload
