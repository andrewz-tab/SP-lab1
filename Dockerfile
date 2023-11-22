FROM debian:stable
COPY . /lab1
WORKDIR /lab1
RUN chmod +x script18.sh

