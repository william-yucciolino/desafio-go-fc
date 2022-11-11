## Build
FROM alpine AS build

COPY --from=golang:1.13-alpine /usr/local/go/ /usr/local/go/
 
ENV PATH="/usr/local/go/bin:${PATH}"

WORKDIR /usr/local/fullcycle

COPY ./hello.go /usr/local/fullcycle/hello.go

RUN go build -o hello

## Deploy
FROM busybox

COPY --from=build /usr/local/fullcycle/hello /hello

ENTRYPOINT ./hello