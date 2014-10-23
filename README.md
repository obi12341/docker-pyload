PyLoad
=========

Introduction
----
pyLoad is a fast, lightweight and full featured download manager for many One-Click-Hoster, container formats like DLC, video sites or just plain http/ftp links. It aims for low hardware requirements and platform independence to be runnable on all kind of systems (desktop pc, netbook, NAS, router).

Despite its strict restriction it is packed full of features just like webinterface, captcha recognition, unrar and much more.

pyLoad is divided into core and clients, to make it easily remote accessible. Currently there are a webinterface, command line interface, and a GUI written in Qt.

Source [official pyload]

Install
----
Install is easy as all docker images

```sh
docker pull obi12341/pyload:0.4.9
```

Run
----
```
docker run -d -P obi12341/pyload:0.4.9
```
You can link your Downloads to your host very easy like that:

```sh
docker run -d -v <host directoy>:/opt/pyload/Downloads -P obi12341/pyload:0.4.9
```
Notice to replace ```<host directory>``` with your directory path on the host. So if you want to store your Downloads in ```/tmp/Downloads``` then your command would look like this:

```sh
docker run -d -v /tmp/Downloads:/opt/pyload/Downloads -P obi12341/pyload:0.4.9
```



[official pyload]:http://pyload.org/
