# Set the base image to use to Ubuntu
FROM ubuntu:15.04

# Change mirrors to local
RUN echo "deb http://ie.archive.ubuntu.com/ubuntu vivid main restricted universe" > /etc/apt/sources.list
RUN echo "deb http://ie.archive.ubuntu.com/ubuntu vivid-updates main restricted universe" >> /etc/apt/sources.list
RUN echo "deb http://ie.archive.ubuntu.com/ubuntu vivid-security main restricted universe" >> /etc/apt/sources.list

# Set the file maintainer (your name - the file's author)
MAINTAINER FRLinux

# Update the default application repository sources list
RUN apt-get update

# Install debs
RUN apt-get install -y pcp git build-essential wget npm

# Install bower (used to install vector)
RUN npm install -g bower

# Edit path to add bower
ENV PATH /usr/local/bin:$PATH
RUN ln -s /usr/bin/nodejs /usr/local/bin/node

# Clone netflix vector and install
RUN git clone https://github.com/Netflix/vector.git

#RUN git clone https://github.com/Netflix/vector.git
RUN cd vector
RUN /usr/local/bin/bower --allow-root install
RUN npm install
RUN npm install -g gulp
RUN gulp
RUN cd vector/app
RUN python -m SimpleHTTPServer 8080

# Port to expose 
#EXPOSE 8080

# Set the entrypoint 
ENTRYPOINT bash
