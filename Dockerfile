FROM alpine:latest
RUN apk add --no-cache curl
RUN curl -L https://github.com/navidrome/navidrome/releases/download/v0.58.0/navidrome-linux-amd64.tar.gz -o navidrome.tar.gz
RUN tar -xvzf navidrome.tar.gz && rm navidrome.tar.gz
RUN mkdir /music /data
ENV ND_HOME=/data
ENV ND_SCANINTERVAL=30
EXPOSE 4533
CMD ["./navidrome", "--datafolder", "/data", "--musicfolder", "/music", "--port", "4533"]
