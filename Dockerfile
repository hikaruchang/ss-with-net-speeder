# ss-with-net-speeder

FROM ubuntu:16.04.4
MAINTAINER hikaruchang <i@rua.moe>
RUN apt-get update && \
    apt-get install -y software-properties-common openssh-server libnet1 libnet1-dev libpcap0.8 libpcap0.8-dev git && \
    add-apt-repository ppa:max-c-lv/shadowsocks-libev -y && \
    apt-get update && \
    apt install shadowsocks-libev


RUN echo "root:password"|chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh

RUN mv net_speeder /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/net_speeder

# Configure container to run as an executable
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
EXPOSE 22
