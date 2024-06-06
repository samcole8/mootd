package main

import (
	"io"
	"net/http"
	"os"
	"os/exec"
)

func check() {
	if _, err := os.Stat("/srv/first_run"); err == nil {
		exec.Command("/bin/sh", "/usr/local/bin/renew.sh").Run()
		os.Remove("/srv/first_run")
	}
}

func get(w http.ResponseWriter, _ *http.Request) {
	content, _ := os.ReadFile("/srv/mootd")
	io.WriteString(w, string(content))
}

func main() {
	check()
	http.HandleFunc("/", get)
	http.ListenAndServe(":80", nil)
}
