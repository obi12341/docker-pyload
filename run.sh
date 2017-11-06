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

[ -z "$UID" ] && UID=0
[ -z "$GID" ] && GID=0

# Appending a line at the end of /etc/passwd /etc/group is safer
# than using adduser because if UID and GID are already present,
# adduser will fail while this will work as expected.
echo -e "appuser:x:${UID}:${GID}:appuser:/app:/bin/false\n" >> /etc/passwd
echo -e "appgroup:x:${GID}:appuser\n" >> /etc/group

chown -R appuser:appgroup /opt/pyload

exec gosu appuser python /opt/pyload/pyLoadCore.py

