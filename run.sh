#!/bin/bash

if [ ! -f "/opt/pyload/pyload-config/setup.lock" ]
then
        mkdir -p /opt/pyload/pyload-config
        chmod 777 /opt/pyload/pyload-config

        mv /tmp/pyload-config/* /opt/pyload/pyload-config/
fi

if [ -f "/opt/pyload/pyload-config/pyload.pid" ]
then
        rm /opt/pyload/pyload-config/pyload.pid
fi

exec /opt/pyload/pyLoadCore.py
