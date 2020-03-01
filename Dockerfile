FROM alpine:latest

ENV VER=2.10.1
ENV METHOD=chacha20
ENV PASSWORD=123456
ENV PORT=8080
ENV TLS_PORT=4433

RUN apk add --no-cache curl \
  && curl -sLO https://github.com/ginuerzh/gost/releases/download/v${VER}/gost-linux-amd64-${VER}.gz \
  && gzip -d gost-linux-amd64-${VER}.gz \
  && chmod +x gost-linux-amd64-${VER}

EXPOSE ${TLS_PORT} $PORT
WORKDIR /
CMD /gost-linux-amd64-${VER} -L=tls://:${TLS_PORT}/:$PORT -L=ss://$METHOD:$PASSWORD@:$PORT