FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y apt-transport-https curl gnupg2
RUN curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list

RUN apt-get update
RUN apt-get install -y dart

ENV PATH="$PATH:/usr/lib/dart/bin"

RUN groupadd -g 1000 dart && \
    useradd -u 1000 -g dart -m dart -G sudo

WORKDIR /dart_app

RUN chown -R dart:dart /dart_app

USER dart

CMD ["bash"]
