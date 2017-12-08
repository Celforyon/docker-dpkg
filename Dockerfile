FROM debian:latest

LABEL maintainer="Alexis Pereda <alexis@pereda.fr>"
LABEL version="2.2"
LABEL description="dpkg"

RUN apt update && \
	apt install --no-install-recommends --no-install-suggests -y \
	fakeroot lintian piuparts sudo && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir /shared

COPY bin/* /usr/local/bin/
COPY sudoers.d/* /etc/sudoers.d/

RUN useradd -ms /bin/bash packager

VOLUME ["/shared"]
