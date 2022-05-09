# Builder
FROM golang:1.18-alpine as builder
RUN apk add git && apk update

ENV GO111MODULE=on
ENV CGO=off

COPY . $GOPATH/src/github.com/smallnest/go-web-framework-benchmark
WORKDIR $GOPATH/src/github.com/smallnest/go-web-framework-benchmark
RUN go mod download && go build -o gowebbenchmark .


# Runner
FROM alpine:latest as runner
RUN apk add bash libressl wrk gnuplot ttf-dejavu ttf-droid ttf-freefont ttf-liberation

VOLUME ["/data"]
COPY --from=builder /go/src/github.com/smallnest/go-web-framework-benchmark/gowebbenchmark /go-web-framework-benchmark/gowebbenchmark
COPY --from=builder /go/src/github.com/smallnest/go-web-framework-benchmark/testresults/ /go-web-framework-benchmark/testresults/
COPY --from=builder /go/src/github.com/smallnest/go-web-framework-benchmark/*.sh /go-web-framework-benchmark
COPY --from=builder /go/src/github.com/smallnest/go-web-framework-benchmark/*.lua /go-web-framework-benchmark

WORKDIR /go-web-framework-benchmark
CMD ["/bin/sh", "./docker-test.sh"]
