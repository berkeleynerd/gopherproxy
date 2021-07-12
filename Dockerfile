FROM golang:alpine

EXPOSE 80/tcp

ENTRYPOINT ["gopherproxy"]

RUN \
    apk add --update git && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /go/src/git.mills.io/prologic/gopherproxy
WORKDIR /go/src/git.mills.io/prologic/gopherproxy

COPY . /go/src/git.mills.io/prologic/gopherproxy

RUN go get -v -d
RUN go install -v git.mills.io/prologic/gopherproxy/...
