package main

import (
	"github.com/go-martini/martini"
	"github.com/mipearson/rfw"
	"github.com/martini-contrib/logstasher"
	"log"
)

func main() {
	m := martini.Classic()

	logstashLogFile, err := rfw.Open("hello.log", 0644)
	if err != nil {
		log.Fatalln(err)
	}
	defer logstashLogFile.Close()
	m.Use(logstasher.Logger(logstashLogFile))
	m.Get("/", func() string {
		return "Hello world!"
	})
	m.Run()
}
