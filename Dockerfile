#
# DESCRIPTION:    Image with Emacs
# TO_BUILD:       docker build -t amcorreia/docker-emacs .
# TO_RUN:         docker run -d --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:/home/user -e DISPLAY=unix$DISPLAY --name emacs amcorreia/docker-emacs

FROM debian:stretch

MAINTAINER  Alessandro Madruga Correia <mutley.sandro@gmail.com>

# To avoid problems with Dialog and curses wizards
ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :0.0
ENV USER user
ENV UID 1000
ENV GID 1000
ENV HOME /home/$USER

# Build emacs
ARG EMACS_REPOSITORY="git://git.sv.gnu.org/emacs.git"
ARG EMACS_BRANCH="emacs-26.1"

RUN apt-get update -y && \
    apt-get --yes --quiet --no-install-recommends install git build-essential autoconf automake texinfo libtool \
        texinfo build-essential xorg-dev libgtk2.0-dev libjpeg-dev libncurses5-dev libdbus-1-dev libgif-dev \
        libtiff-dev libm17n-dev librsvg2-dev libotf-dev libgnutls28-dev libxml2-dev && \
    rm -rf -- /var/lib/apt/lists/* && \
    git clone --depth 1 --branch $EMACS_BRANCH $EMACS_REPOSITORY /tmp/emacs && \
    cd /tmp/emacs && \
    ./autogen.sh && \
    ./configure && \
    make -j 16 install && \
    rm -rf /tmp/emacs && \
    useradd --uid $UID --create-home --home-dir $HOME --shell /usr/sbin/nologin $USER

USER $USER

WORKDIR $HOME

VOLUME ["/tmp/.X11-unix", "$HOME"]

ENTRYPOINT [ "emacs" ]
