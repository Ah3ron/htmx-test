FROM golang:1.23.1 AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o myapp .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /app/myapp /myapp
COPY --from=builder /app/views /views
EXPOSE 3000
CMD ["/myapp"]

