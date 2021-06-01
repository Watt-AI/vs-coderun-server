FROM codercom/code-server:3.9.3

# install python
RUN sudo apt update
RUN sudo apt install -y wget software-properties-common build-essential libnss3-dev zlib1g-dev libgdbm-dev libncurses5-dev   libssl-dev libffi-dev libreadline-dev libsqlite3-dev libbz2-dev
RUN sudo wget https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz
RUN sudo tar xvf Python-3.9.5.tgz ; cd Python-3.9.5 ; sudo ./configure --enable-optimizations ; sudo make altinstall
RUN sudo rm -rf Python-3.9.5*


# python dependencies
COPY requirements.txt ./
RUN pip3.9 install -r requirements.txt
RUN rm requirements.txt

# copy configs
COPY config.yaml ./
