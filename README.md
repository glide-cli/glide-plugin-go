# glide-plugin-go

[![CI](https://github.com/ivannovak/glide-plugin-go/actions/workflows/ci.yml/badge.svg)](https://github.com/ivannovak/glide-plugin-go/actions/workflows/ci.yml)
[![Semantic Release](https://github.com/ivannovak/glide-plugin-go/actions/workflows/semantic-release.yml/badge.svg)](https://github.com/ivannovak/glide-plugin-go/actions/workflows/semantic-release.yml)

Go framework detector plugin for [Glide CLI](https://github.com/ivannovak/glide).

## Overview

This plugin provides Go project detection and framework-specific command suggestions for Glide. When installed, Glide will automatically detect Go projects and provide intelligent command completions for common Go workflows.

## Installation

### From GitHub Releases (Recommended)

```bash
glide plugins install github.com/ivannovak/glide-plugin-go
```

### From Source

```bash
# Clone the repository
git clone https://github.com/ivannovak/glide-plugin-go.git
cd glide-plugin-go

# Build and install (requires Go 1.24+)
make install
```

## What It Detects

The plugin automatically detects Go projects by looking for:

- **Required files**: `go.mod`
- **Optional files**: `go.sum`, `go.work`
- **Directories**: `vendor/`
- **File extensions**: `.go`

### Enhanced Detection

The plugin also extracts additional metadata from your Go project:

- **Go version**: Detected from `go.mod`
- **Module name**: Extracted from `go.mod`
- **Workspace mode**: Detects `go.work` files
- **Development tools**: Recognizes `.golangci.yml`, `.goreleaser.yml`, and `Makefile`

## Available Commands

Once a Go project is detected, the following commands become available:

### Build Commands
- `build` - Build Go project (`go build ./...`)
- `generate` - Generate Go files (`go generate ./...`)

### Test Commands
- `test` - Run Go tests (`go test ./...`)
- `test:v` - Run tests with verbose output (`go test -v ./...`)
- `test:race` - Run tests with race detector (`go test -race ./...`)
- `test:cover` - Run tests with coverage (`go test -cover ./...`)

### Run Commands
- `run` - Run Go application (`go run .`)

### Code Quality Commands
- `fmt` - Format Go code (`go fmt ./...`)
- `vet` - Examine Go source code (`go vet ./...`)

### Dependency Management
- `mod:tidy` - Add missing and remove unused modules (`go mod tidy`)
- `mod:download` - Download modules to local cache (`go mod download`)
- `mod:vendor` - Make vendored copy of dependencies (`go mod vendor`)

## Configuration

The plugin works out-of-the-box without configuration. However, you can customize behavior in your `.glide.yml`:

```yaml
plugins:
  go:
    enabled: true
    # Additional configuration options can be added here in the future
```

## Examples

### Basic Go Project

```bash
# Navigate to your Go project
cd my-go-app

# Glide automatically detects Go and provides suggestions
glide help

# Run common Go commands through Glide
glide build
glide test
glide fmt
```

### Go Workspace

```bash
# In a Go workspace with go.work
cd my-workspace

# Glide detects workspace mode
glide context  # Shows workspace: true

# Run commands across all workspace modules
glide test
glide build
```

### Common Workflows

```bash
# Development workflow
glide fmt          # Format code
glide vet          # Run static analysis
glide test:race    # Run tests with race detector
glide build        # Build the application

# Dependency management
glide mod:tidy     # Clean up dependencies
glide mod:vendor   # Vendor dependencies
```

## Development

### Prerequisites

- Go 1.24 or higher
- Make (optional, for convenience targets)

### Building

```bash
# Run tests
make test

# Run tests with coverage
make test-coverage

# Run linters
make lint

# Format code
make fmt
```

### Testing

The plugin includes comprehensive tests for:

- Go version detection
- Module name extraction
- Workspace detection
- Tool detection
- Command registration

```bash
# Run all tests
go test ./...

# Run tests with verbose output
go test -v ./...

# Run tests with coverage
go test -cover ./...
```

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass (`make test`)
6. Submit a pull request

## License

MIT License - see [LICENSE](LICENSE) for details.

## Related Projects

- [Glide](https://github.com/ivannovak/glide) - The main Glide CLI
- [glide-plugin-docker](https://github.com/ivannovak/glide-plugin-docker) - Docker plugin for Glide
- [glide-plugin-node](https://github.com/ivannovak/glide-plugin-node) - Node.js plugin for Glide
- [glide-plugin-php](https://github.com/ivannovak/glide-plugin-php) - PHP plugin for Glide

## Support

- [GitHub Issues](https://github.com/ivannovak/glide-plugin-go/issues)
- [Glide Documentation](https://github.com/ivannovak/glide#readme)
- [Plugin Development Guide](https://github.com/ivannovak/glide/blob/main/docs/PLUGIN_DEVELOPMENT.md)
