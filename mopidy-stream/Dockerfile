FROM phusion/baseimage:latest
MAINTAINER Thomas Beyer <beyer.thomas@gmail.com>

##########################################################################################
# baseimage specific stuff
ENV HOME /root

##########################################################################################
# disable ssh
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

##########################################################################################
# Prepare ubuntu for apt-add and install mopidy
RUN apt-get update && apt-get install -y \
      wget \
      software-properties-common \
      sudo \
      git \
      liquidsoap \
      python-pip \
      python-cffi \
      mpc \
      nano &&\
    wget -q -O - http://apt.mopidy.com/mopidy.gpg | apt-key add - &&\
    wget -q -O /etc/apt/sources.list.d/mopidy.list http://apt.mopidy.com/mopidy.list &&\
    apt-get -qq update &&\
    apt-get install -y \
      mopidy \
      python-spotify

##########################################################################################
# Dont use mopidy-spotify from repository, use self-compiled version due to bug with playlists
RUN pip install --upgrade pip &&\
    git clone https://github.com/kingosticks/mopidy-spotify.git &&\
    cd mopidy-spotify &&\
    git checkout "fix/web_api_playlists" &&\
    python2.7 setup.py build install

##########################################################################################
# Add configurations
ADD cfg/mopidy.conf /etc/mopidy/mopidy.conf
ADD cfg/mopidy.liq /usr/local/bin/mopidy.liq
RUN chmod +x /usr/local/bin/mopidy.liq

##########################################################################################
# Add init scripts
RUN mkdir /etc/service/00-liquidsoap
ADD run/liquidsoap.sh /etc/service/00-liquidsoap/run
RUN chmod +x /etc/service/00-liquidsoap/run

RUN mkdir /etc/service/01-mopidy
ADD run/mopidy.sh /etc/service/01-mopidy/run
RUN chmod +x /etc/service/01-mopidy/run

##########################################################################################
# Finish container
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 6680
EXPOSE 6600
EXPOSE 8800

CMD ["/sbin/my_init"]
