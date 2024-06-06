#!/bin/bash

# Compile entrypoint
CGO_ENABLED=0 go build -o ./bin/api api.go

# Build container
docker build -t mootd .
