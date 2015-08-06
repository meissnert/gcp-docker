# GCP Client

#base image from https://github.com/phusion/baseimage-docker
FROM phusion/baseimage:0.9.10

# Maintainer 
MAINTAINER Tobias Meissner "meissner.t@googlemail.com"

# update system
RUN apt-get update &&  apt-get upgrade -y && apt-get dist-upgrade -y

# install some system tools
RUN apt-get install -y wget python

# install GCP client
RUN cd /opt && \
  wget -c https://s3.amazonaws.com/connect.globusonline.org/linux/stable/globusconnectpersonal-latest.tgz && \
  tar xzf globusconnectpersonal-latest.tgz
RUN rm /opt/globusconnectpersonal-latest.tgz
RUN mv /opt/globusconnectpersonal-* /opt/globusconnectpersonal

# Use baseimage-docker's bash.
CMD ["/bin/bash"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add GCP to PATH
ENV PATH /opt/globusconnectpersonal/:$PATH
