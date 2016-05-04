FROM alpine

RUN apk add --update radvd

ADD run.sh /run.sh

ENTRYPOINT /run.sh
