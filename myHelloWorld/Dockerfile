# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

ADD . /go/src/memo/my-hello-world

RUN go install memo/my-hello-world

# Run the service
ENTRYPOINT /go/bin/my-hello-world

# Document that the service listens on port 8484.
EXPOSE 8484
