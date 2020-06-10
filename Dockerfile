#ros image
#FROM ros:melodic

#Jetson image
#FROM nvcr.io/nvidia/l4t-base:r32.2

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

#clone my github fork of the tensorflow models repository
RUN apt-get install -y --force-yes git
RUN git clone https://github.com/BraedenCullenCodes/models.git
#RUN cd models
#RUN cd research
#RUN python3 setup.py install

#install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

#JETSON VER
RUN apt-get install python3-numpy -y
#RUN apt-get install --force-yes python3-pandas -y 
#need matplotlib for tensorflow object detection packages
RUN apt-get install python3-matplotlib -y
RUN python3.6 -m pip install --upgrade pip setuptools wheel
#RUN python3.6 -m pip install numpy
#RUN python3.6 -m pip install pandas
#RUN python3.6 -m pip install matplotlib
#dont need below command unless not using tensorflow img as base img
#RUN python3.6 -m pip install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 tensorflow
RUN apt-get install -y --force-yes python3-opencv
#install jupyter notebook
RUN apt install -y --force-yes python3-notebook jupyter jupyter-core python-ipykernel  

#In the following I am using my container, named vexai3 

#to create the vexai3 docker image, run docker build --tag (containername)) .

#to start a previously built docker container: docker start -a -i vexai3

#to run docker run --name vexai3 -it vexaiimage /bin/bash
# or to use files on current device do below
#TO Run using files mounted on host filesystem do: docker run -v (hostdirectory):(containerDirectory) --name vexai3 -it vexaiimage /bin/bash

#to copy files from host to container, do docker cp foo.txt mycontainer:/foo.txt

#to run from usb do: docker run -t -i --device=/dev/ttyUSB0 ubuntu bash

#to stop: docker stop vexai3

#to pause: docker pause vexai3

#TO PUSH TO DOCKERHUB (need to run docker login first)
#tag image like so: docker tag firstimage YOUR_DOCKERHUB_NAME/firstimage
#then push: docker push YOUR_DOCKERHUB_NAME/firstimage

#below are commands to setup a docker container for jupyter notebook use
#docker run -v /Users/bruh/Development/docker/mounts/mountForFirstModel:/HOME -p 8888:8888 --name vexai3 -it vexaiimage /bin/bash
#in container:  jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
#On host: localhost:8888/tree‌​ (followed by key printed on command line)


