FROM alpine:latest

ENV VER=2.10.1
ENV METHOD=chacha20
ENV PASSWORD=123456
ENV PORT=8080

RUN apk add --no-cache curl tar \
  && curl -sL https://github.com/ginuerzh/gost/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
  && chmod +x gost_${VER}_linux_amd64/gost

CMD /gost_${VER}_linux_amd64/gost -L=ss://$METHOD:$PASSWORD@:$PORT