FROM ubuntu:bionic

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN echo "updating packages" && apt-get update

RUN apt-get -y install \
        openssh-server git net-tools nano \
	iproute2 supervisor less \
        sudo wget gpg jq

RUN apt install -y npm libbluetooth-dev

RUN cd / && git clone https://github.com/sebastianha/um34c.git

RUN cd /um34c && npm install

RUN apt install -y dbus

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash", "--login"]
