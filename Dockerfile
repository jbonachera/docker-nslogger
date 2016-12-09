FROM jbonachera/arch
MAINTAINER Julien BONACHERA <julien@bonachera.fr>

VOLUME /var/lib/dnstap
ENV GOPATH=/usr/local/src/go
RUN pacman -S --noconfirm go git && \
    go get -u -v github.com/dnstap/golang-dnstap/dnstap && \
    useradd -r dnstap && \
    cp $GOPATH/bin/dnstap /usr/local/bin/dnstap &&\
    rm -rf $GOPATH

CMD ["/usr/local/bin/dnstap", "-u", "/var/lib/dnstap/capture.sock"]
