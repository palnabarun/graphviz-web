FROM golang:alpine as BUILD

WORKDIR /app
ADD . /app

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o web .

FROM alpine

COPY --from=BUILD /app /app
EXPOSE 8080
WORKDIR /app

CMD ["./web"]
