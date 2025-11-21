.PHONY: test test-coverage test-verbose lint fmt clean help

# Run tests
test:
	go test ./...

# Run tests with coverage
test-coverage:
	go test -cover ./...

# Run tests with verbose output
test-verbose:
	go test -v ./...

# Run linters
lint:
	go vet ./...
	@command -v golangci-lint >/dev/null 2>&1 && golangci-lint run || echo "golangci-lint not installed, skipping"
	@command -v staticcheck >/dev/null 2>&1 && staticcheck ./... || echo "staticcheck not installed, skipping"

# Format code
fmt:
	go fmt ./...
	gofmt -s -w .

# Tidy dependencies
tidy:
	go mod tidy

# Clean build artifacts
clean:
	go clean
	rm -f coverage.out coverage.html

# Show help
help:
	@echo "Available targets:"
	@echo "  test          - Run tests"
	@echo "  test-coverage - Run tests with coverage"
	@echo "  test-verbose  - Run tests with verbose output"
	@echo "  lint          - Run linters"
	@echo "  fmt           - Format code"
	@echo "  tidy          - Tidy dependencies"
	@echo "  clean         - Clean build artifacts"
	@echo "  help          - Show this help message"
