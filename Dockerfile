# Use Go 1.21 as the builder image
FROM golang:1.21 as builder

# Set the working directory
WORKDIR /app

# Copy Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod tidy

# Copy the entire application directory into the container
COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o svc cmd/main.go

# Use a minimal scratch image for the final image
FROM scratch

# Copy the Go binary from the appropriate builder image
COPY --from=builder /app/svc /svc

# Command to run your Go application
CMD ["/svc"]
