FROM ubuntu:16.04
MAINTAINER Hemant Kashniyal <hemantkashniyal@gmail.com>
RUN apt-get update && apt-get install -y software-properties-common && apt-get install -y gcc && apt-get install -y gdb && apt-get install -y vim

RUN apt-get install -y autoconf automake libtool curl make g++ unzip git

RUN git clone https://github.com/google/protobuf.git
RUN cd protobuf && git checkout tags/v3.6.1

RUN cd protobuf && git submodule update --init --recursive && ./autogen.sh
RUN .cd protobuf && /configure --prefix=/usr && make && make check && make install && ldconfig
RUN rm -rf protobuf
