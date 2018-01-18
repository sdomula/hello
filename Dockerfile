FROM alpine:3.6

ADD hello /hello

ENTRYPOINT [ "/hello" ]
