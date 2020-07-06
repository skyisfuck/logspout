FROM alpine:3.11
ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 80

COPY . /src
RUN cd /src && ./build.sh "$(cat VERSION)"

COPY ./build.sh /src/build.sh
COPY ./modules.go /src/modules.go
RUN cd /src && chmod +x ./build.sh && sleep 1 && sync && ./build.sh "$(cat VERSION)-custom"
