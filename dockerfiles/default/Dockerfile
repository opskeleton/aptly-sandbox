FROM phusion/baseimage

ENV HOSTNAME aptly
RUN apt-get update
RUN apt-get install wget -y
RUN /usr/bin/wget 'https://gist.githubusercontent.com/narkisr/6097786/raw' --no-check-certificate && /bin/bash raw
ADD pkg/aptly-sandbox-0.0.1.tar.gz /
RUN cd aptly-sandbox-0.0.1 && /bin/bash run.sh
RUN rm -rf aptly-sandbox-0.0.1 

CMD ["/sbin/my_init"]
EXPOSE 8080
