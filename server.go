package main

import (
	"database/sql"
	"fmt"
	"github.com/go-martini/martini"
	_ "github.com/lib/pq"
	"github.com/martini-contrib/logstasher"
	"github.com/mipearson/rfw"
	"net/http"
)

func SetupDB() *sql.DB {
	// change user=XXX to your Postgres database user name.
	db, err := sql.Open("postgres", "user=mwang dbname=postgres sslmode=disable")
	PanicIf(err)
	return db
}

func PanicIf(err error) {
	if err != nil {
		panic(err)
	}
}

func main() {
	m := martini.Classic()
	m.Map(SetupDB())

	//added logstasher

	logstashLogFile, err := rfw.Open("goes.log", 0644)
	PanicIf(err)
	defer logstashLogFile.Close()
	m.Use(logstasher.Logger(logstashLogFile))
	m.Use(martini.Static("public"))

	// get
	m.Get("/book", func(db *sql.DB, r *http.Request, rw http.ResponseWriter) {
		search := "%" + r.URL.Query().Get("search") + "%"
		rows, err := db.Query(`SELECT title, author, description
                FROM books
                WHERE title ILIKE $1
                OR author ILIKE $1
                OR description ILIKE $1`, search)
		PanicIf(err)
		defer rows.Close()

		var title, author, description string
		for rows.Next() {
			err := rows.Scan(&title, &author, &description)
			PanicIf(err)
			fmt.Fprintf(rw, "Title: %s\nAuther: %s\nDescription: %s\n\n", title, author, description)
		}
	})

	// login
	m.Post("/login", PostLogin)
	m.Run()
}

func PostLogin(req *http.Request, db *sql.DB) (int, string) {
	var id string

	email, password := req.FormValue("email"), req.FormValue("password")
	err := db.QueryRow("select id from users where email=$1 and password=$2", email, password).Scan(&id)

	if err != nil {
		return 401, "Unauthorized"
	}
	return 200, "User id is " + id
}
