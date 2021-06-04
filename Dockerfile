FROM codercom/code-server:3.9.3

# update/upgrade
RUN sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y

# install python
RUN sudo apt install python3-pip -y

# python dependencies
COPY requirements.txt ./
RUN pip3 install -r requirements.txt
RUN rm requirements.txt