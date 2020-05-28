#ros image
FROM ros:melodic

#NEED TO RUN AS ROOT
USER root
RUN echo $HOME

#set working directory
WORKDIR = $HOME

#install python and curl
RUN apt-get update

RUN apt-get install curl

RUN apt-get install -y --force-yes python3.6

#install pip
RUN apt install -y --force-yes python3-pip

#Install opencv, tensorflow, numpy, pandas, and matplotlib
RUN python3.6 -m pip install opencv-python
RUN python3.6 -m pip install --upgrade tensorflow
RUN python3.6 -m pip install numpy
RUN python3.6 -m pip install pandas
RUN python3.6 -m pip install matplotlib

#to run docker run --name vexai3 -it vexaiimage
#to copy files from host to container, do docker cp foo.txt mycontainer:/foo.txt
#to run from use do: docker run -t -i --device=/dev/ttyUSB0 ubuntu bash