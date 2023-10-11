package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gorilla/mux"
)

func main() {
	// Create a new router instance
	r := mux.NewRouter()

	// Define a handler function
	r.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		// Print "Hello, World!"
		fmt.Fprintln(w, "Hello, World!")

		// Print environment variables
		env := os.Environ()
		fmt.Fprintln(w, "Environment Variables:")
		for _, v := range env {
			fmt.Fprintln(w, v)
		}
	})

	// Set up and start the HTTP server
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080" // Default port
	}
	fmt.Printf("Listening on port %s...\n", port)
	err := http.ListenAndServe(":"+port, r)
	if err != nil {
		fmt.Printf("Error: %s\n", err)
	}
}
