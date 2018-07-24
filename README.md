#amcorreia/docker-emacs
==================

[![Docker Stars](https://img.shields.io/docker/stars/amcorreia/docker-emacs.svg)](https://hub.docker.com/r/amcorreia/docker-emacs/)
[![Docker Pulls](https://img.shields.io/docker/pulls/amcorreia/docker-emacs.svg)](https://hub.docker.com/r/amcorreia/docker-emacs/)
[![Docker Build](https://img.shields.io/docker/automated/amcorreia/docker-emacs.svg)](https://hub.docker.com/r/amcorreia/docker-emacs/)
[![Layers](https://images.microbadger.com/badges/image/amcorreia/docker-emacs.svg)](https://microbadger.com/images/amcorreia/docker-emacs)
[![Version](https://images.microbadger.com/badges/version/amcorreia/docker-emacs.svg)](https://microbadger.com/images/amcorreia/docker-emacs)


Docker container image with Emacs.


### How to run

```sh
$ docker run -it --rm -v $HOME:/home/user -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY=unix$DISPLAY --name emacs amcorreia/docker-emacs
```

### How to build

```sh
$ docker build --no-cache --rm  -t amcorreia/docker-emacs .
```

If get segmentation fault because of ASLR, just disable

echo 0 > /proc/sys/kernel/randomize_va_space
