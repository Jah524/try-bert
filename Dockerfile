from tensorflow/tensorflow:1.12.0-gpu-py3

RUN apt update &&\
    apt upgrade -y

RUN add-apt-repository -y ppa:jonathonf/python-3.6 &&\
    apt-get update &&\
    apt-get -y install python3.6-dev

RUN echo 'alias python=python3.6' >> ~/.bashrc
RUN apt install -y python3-pip
RUN python3.6 -m pip install --upgrade setuptools
RUN python3.6 -m pip install --upgrade pip

RUN mkdir -p ~/workspace
WORKDIR workspace

# Machine Learning
RUN python3.6 -m pip install tensorflow-gpu==1.12.0 keras numpy scipy sentencepiece pandas
RUN python3.6 -m pip install jupyter matplotlib seaborn keras-bert fastprogress

# Base libraries
RUN apt install -y curl wget emacs24-nox unzip git

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

EXPOSE 8888
CMD ["/bin/bash"]