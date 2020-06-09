#ros image
#FROM ros:melodic

#Jetson image
FROM nvcr.io/nvidia/l4t-base:r32.2

#JETSON IMAGE WITH TENSORFLOW 
FROM nvcr.io/nvidia/l4t-tensorflow:r32.4.2-tf1.15-py3

#NEED TO RUN AS ROOT
USER root
RUN echo $HOME

#set working directory
WORKDIR = /HOME

#install python and curl
RUN apt-get update
RUN apt-get install -y --force-yes curl
RUN apt-get install -y --force-yes python3.6
RUN apt-get install -y --force-yes python3-dev

#install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

#Install opencv, tensorflow, numpy, pandas, and matplotlib
#THESE COMMANDS WORK ON MAC, BUT NOT ALL WORK ON JETSON
#RUN apt-get install -y --force-yes python3-opencv
#RUN python3.6 -m pip install --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-1.12.0-py3-none-any.whl
#RUN python3.6 -m pip install numpy
#RUN python3.6 -m pip install pandas
#RUN python3.6 -m pip install matplotlib

#JETSON VER
#need to install setup tools like this or a bunch of errors occour
RUN apt-get install python3-numpy -y
#RUN apt-get install --force-yes python3-pandas -y 
#RUN apt-get install python3-matplotlib -y
RUN python3.6 -m pip install --upgrade pip setuptools wheel
#RUN python3.6 -m pip install numpy
#RUN python3.6 -m pip install pandas
#RUN python3.6 -m pip install matplotlib
#dont need below command unless not using tensorflow img as base img
#RUN python3.6 -m pip install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 tensorflow
RUN apt-get install -y --force-yes python3-opencv

#In the following I am using my container, named vexai3 
#to create the vexai3 docker image, run docker build --tag (containername)) .
#to run docker run --name vexai3 -it vexaiimage /bin/bash
#to copy files from host to container, do docker cp foo.txt mycontainer:/foo.txt
#to run from usb do: docker run -t -i --device=/dev/ttyUSB0 ubuntu bash
#to stop: docker stop vexai3
#to pause: docker pause vexai3
#to start a previously built docker container: docker start -a -i vexai3