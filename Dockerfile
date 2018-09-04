FROM resin/rpi-raspbian:latest
LABEL maintainer="Sergei Silnov <po@kumekay.com>"

RUN apt-get update && \
    apt-get install -y \
    owserver \
    --no-install-recommends  && \
	  rm -rf /var/lib/apt/lists/*

COPY owfs.conf /etc/owfs.conf

EXPOSE 4304

CMD /usr/bin/owserver -c /etc/owfs.conf --foreground