FROM nvcr.io/nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

# setup package manager and update
RUN apt-get update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get upgrade -y; apt-get autoremove -y

# install useful apt packages
RUN apt-get install -y \
    build-essential \
    vim \
    emacs25 \
    curl \
    libssl-dev \
    wget \
    git

# install python
RUN DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" \
    apt-get install -y \
    python3.8 \
    python3.8-distutils \
    python3-pip \
    python3-dev \
    python3-virtualenv

# upgrade pip
RUN python3.8 -m pip install -U pip setuptools distlib

# python dependencies
COPY requirements.txt ./
RUN python3.8 -m pip install -r requirements.txt --use-deprecated=legacy-resolver --no-cache-dir
RUN rm requirements.txt

# install coderun
RUN curl -fsSL https://code-server.dev/install.sh | sh -s -- --prefix=/usr/local

# envs for video processing
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility
