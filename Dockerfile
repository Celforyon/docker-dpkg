FROM debian:latest

LABEL maintainer="Alexis Pereda <alexis@pereda.fr>"
LABEL version="2.0"
LABEL description="dpkg"

COPY makedeb /usr/local/bin
