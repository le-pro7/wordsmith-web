FROM golang:1.16-alpine AS build

WORKDIR /app

COPY go.mod .

COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o wordsmith-web .

FROM nginx:alpine

WORKDIR /root/

EXPOSE 3000

CMD ["./words.jar-web"]
