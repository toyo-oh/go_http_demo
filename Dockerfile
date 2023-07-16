FROM golang:1.19-alpine

ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR /go_demo

RUN apk update && apk add --no-cache git

COPY . .

RUN go mod tidy

RUN go build -o main .

EXPOSE 8081

CMD ["go", "run", "main.go"]
