FROM golang:1.23.1 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o myapp .

FROM alpine:latest

RUN apk --no-cache add ca-certificates

COPY --from=builder /app/myapp /myapp

EXPOSE 1488

CMD ["/myapp"]

