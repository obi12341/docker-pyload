#!/bin/bash

if [ ! -f "/opt/pyload/pyload-config/setup.lock" ]
then
        mkdir -p /opt/pyload/pyload-config
        chmod 777 /opt/pyload/pyload-config

        mv /tmp/pyload-config/* /opt/pyload/pyload-config/
fi

exec /opt/pyload/pyLoadCore.py
