FROM ubuntu:14.04
MAINTAINER Christopher Schirner <christopher@hackerspace-bamberg.de>

RUN apt-get -yy update
RUN apt-get -yy install dc wget build-essential ghostscript groff cups cups-filters

RUN wget -O /tmp/foo2zjs.tar.gz http://foo2zjs.rkkda.com/foo2zjs.tar.gz
RUN tar xvfz /tmp/foo2zjs.tar.gz -C /usr/local/src
RUN cd /usr/local/src/foo2zjs; make; ./getweb 3200; make install

RUN sed -i "s/localhost:631/0.0.0.0:631/g" /etc/cups/cupsd.conf
RUN sed -i "s/DefaultAuthType Basic/AuthType None/g" /etc/cups/cupsd.conf
RUN sed -i "/<Location \/>/a Allow all" /etc/cups/cupsd.conf
RUN sed -i "/<Location \/admin>/a Allow all" /etc/cups/cupsd.conf
RUN sed -i "/<Location \/admin\/config>/a Allow all" /etc/cups/cupsd.conf

EXPOSE 631

CMD cupsd -f
