from ubuntu

RUN apt-get install -y -q python-software-properties
RUN add-apt-repository ppa:gophers/go
RUN apt-get update
RUN apt-get install -y -q golang-stable

ADD web.go /web.go
RUN go build /web.go

CMD /web
EXPOSE 80
