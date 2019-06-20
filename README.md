PyLoad
=========
[![Build Status](https://travis-ci.org/obi12341/docker-pyload.svg?branch=master)](https://travis-ci.org/obi12341/docker-pyload)

**NOTICE**: If pyload is not able to update plugins, try to use `latest` tag

Introduction
----
pyLoad is a fast, lightweight and full featured download manager for many One-Click-Hoster, container formats like DLC, video sites or just plain http/ftp links. It aims for low hardware requirements and platform independence to be runnable on all kind of systems (desktop pc, netbook, NAS, router).

Despite its strict restriction it is packed full of features just like webinterface, captcha recognition, unrar and much more.

pyLoad is divided into core and clients, to make it easily remote accessible. Currently there are a webinterface, command line interface, and a GUI written in Qt.

Source [official pyload](https://pyload.net/).

Install
----
Install is easy as all docker images

```sh
docker pull writl/pyload:latest
```

Running
----

```sh
docker run -d -P writl/pyload:latest
```

Configuration
----
You can link your Downloads to your host very easy like that:

```sh
docker run -d -v <host directoy>:/opt/pyload/Downloads -P writl/pyload:latest
```
Notice to replace ```<host directory>``` with your directory path on the host. So if you want to store your Downloads in ```/tmp/Downloads``` then your command would look like this:

```sh
docker run -d -v /tmp/Downloads:/opt/pyload/Downloads -P writl/pyload:latest
```
If you want to have your configuration persistent you have to link the configuration directory outside of the container. This can happen like this:

```sh
docker run -d -v <host directoy>:/opt/pyload/pyload-config -P writl/pyload:latest
```

By default, pyload will be run as root, and will download files with uid 0 and gid 0. If you want to change this behavior, you can specify the UID and GID that will be used for the downloaded files by using ENV VARS

Docker run command
-----
```sh
docker \
    run \
    -d \
    -v <host download directory>:/opt/pyload/Downloads \
    -v <host config directoy>:/opt/pyload/pyload-config \
    -e UID=<uid> \
    -e GID=<gid> \
    -P \
    writl/pyload:latest
```
Sample compose file
-----
```yaml
version: "2"
services:
    pyload:
      image: writl/pyload:latest
      container_name: pyload
      ports:
        - 8000:8000
      environment:
        - UID=1000
        - GID=1000
      volumes:
        - /path/to/config:/opt/pyload/pyload-config
        - /path/to/data:/opt/pyload/Downloads

```


Finally
----
When the container has been created you can login via the webinterface at **\<host-ip>:8000** with:

```sh
USER=pyload
PASSWORD=pyload
```


[official pyload]:http://pyload.org/

