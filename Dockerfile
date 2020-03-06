FROM alpine:latest

ENV VER=2.11.0
ENV METHOD=chacha20
ENV PASSWORD=123456
ENV PORT=8080

RUN apk add --no-cache curl \
  && curl -sLO https://github.com/ginuerzh/gost/releases/download/v${VER}/gost-linux-amd64-${VER}.gz \
  && gzip -d gost-linux-amd64-${VER}.gz \
  && chmod +x gost-linux-amd64-${VER}

CMD /gost-linux-amd64-${VER} -L=http://forgame:${PASSWORD}@:${PORT}