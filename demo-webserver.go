package main

import (
	"fmt"
	"log"
	"net/http"
)

type Config struct {
	port    string
	version string
	msg     string
}

func main() {
	config := Config{port: "8888", version: "0.0.1", msg: "exit(0)"}
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hey, I'm demo-server app!\n")
		fmt.Fprintf(w, "My message: %v\n", config.msg)
		fmt.Fprintf(w, "My version: %v\n", config.version)
		fmt.Fprintf(w, "My port: %v\n", config.port)
	})
	err := http.ListenAndServe(":"+config.port, nil)
	if err != nil {
		log.Fatalf("%+v\n", err)
	}
}
