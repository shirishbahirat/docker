FROM ubuntu:16.04

LABEL maintainer="Shirish Bahirat <shirishbahirat@comcast.net>"
LABEL description="This Dockerfile installs build essentials."

ARG DEBIAN_FRONTEND=noninteractive

ADD ./systemc-2.3.3 /home/systemc-2.3.3

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y build-essential && \
    apt-get install -y curl git unzip vim wget && \
    cd .. && \
    cd .. && \
    cd /home/systemc-2.3.3 && \
    mkdir /usr/local/systemc-2.3 && \
    mkdir objdir && \
    cd objdir && \
    ls .. && \
    ../configure -prefix=/usr/local/systemc-2.3 && \
    make && \
    make install

ENV HOME /home

WORKDIR /home

CMD ["bash"]