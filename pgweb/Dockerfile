FROM alpine:3.6
LABEL maintainer="Dan Sosedoff <dan.sosedoff@gmail.com>"
ENV PGWEB_VERSION 0.11.5

RUN \
	apk update && \
	apk add --no-cache ca-certificates openssl postgresql wget && \
	update-ca-certificates && \
	rm -rf /var/cache/apk/* && \
	cd /tmp && \
	wget -q https://github.com/sosedoff/pgweb/releases/download/v$PGWEB_VERSION/pgweb_linux_amd64.zip && \
	unzip pgweb_linux_amd64.zip -d /usr/bin && \
	mv /usr/bin/pgweb_linux_amd64 /usr/bin/pgweb && \
	rm -f pgweb_linux_amd64.zip

EXPOSE 8081

ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

CMD ["/entrypoint.sh"]
