FROM python:2.7.17

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install libusb-1.0

# install rfcat-master
WORKDIR /tmp
ADD rfcat-master.zip .
RUN unzip rfcat-master.zip
WORKDIR /tmp/rfcat-master
RUN python setup.py install

# install related python utilities
WORKDIR /tmp
RUN pip install pyusb

# clean up
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /tmp/* /var/tmp/*
