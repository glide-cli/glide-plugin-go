package main

import (
	"fmt"
	"os"

	"github.com/glide-cli/glide-plugin-go/internal/plugin"
	"github.com/glide-cli/glide/v3/pkg/plugin/sdk/v2"
)

func main() {
	// Create the plugin instance
	p := plugin.New()

	// Start the plugin server using SDK v2
	if err := v2.Serve(p); err != nil {
		fmt.Fprintf(os.Stderr, "Plugin error: %v\n", err)
		os.Exit(1)
	}
}
