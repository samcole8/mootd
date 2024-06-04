package main

import (
	"io"
	"net/http"
	"os"
)

func get(w http.ResponseWriter, r *http.Request) {
	content, _ := os.ReadFile("/srv/mootd")
	io.WriteString(w, string(content))
}

func main() {
	http.HandleFunc("/", get)
	http.ListenAndServe(":80", nil)
}
