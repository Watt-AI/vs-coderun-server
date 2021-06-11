FROM nvcr.io/nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

# setup package manager and update
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update; apt upgrade -y; apt autoremove -y

# install useful apt packages
RUN apt install -y \
    build-essential \
    vim \
    emacs25 \
    curl \
    libssl-dev \
    wget \
    git

# install python
RUN DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" \
    apt install -y \
    python3.9 \
    python3-pip \
    python3-dev \
    python3-virtualenv

# upgrade pip
RUN apt install -y python3.9-distutils
RUN python3.9 -m pip install -U pip setuptools distlib

# python dependencies
COPY requirements.txt ./
RUN python3.9 -m pip install -r requirements.txt --use-deprecated=legacy-resolver
RUN rm requirements.txt

# install coderun
RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --prefix=/usr/local

ENV USER=coder
WORKDIR /home/coder