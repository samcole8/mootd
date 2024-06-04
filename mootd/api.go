package main

import (
	"net/http"
	"io"
	"os"
)

func get(w http.ResponseWriter, r *http.Request) {
	content, _ := os.ReadFile("mootd")
	io.WriteString(w, string(content))
}

func main() {
	http.HandleFunc("/", get)
	http.ListenAndServe(":80", nil)	
}
