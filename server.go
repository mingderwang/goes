package main

import (
	"database/sql"
	"fmt"
	"github.com/go-martini/martini"
	_ "github.com/lib/pq"
	"github.com/martini-contrib/logstasher"
	"github.com/martini-contrib/sessions"
	"github.com/mipearson/rfw"
	"net/http"
)

type User struct {
	Name  string
	Email string
}

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

	// Sessions
	store := sessions.NewCookieStore([]byte("12353453123123123"))
	m.Use(sessions.Sessions("goes_auth", store))

	m.Get("/hello", RequireLogin, SecretPath)
	m.Get("/book", RequireLogin, func(db *sql.DB, r *http.Request, rw http.ResponseWriter) {
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

	m.Post("/login", PostLogin)
	m.Get("/logout", Logout)
	m.Run()
}

func SecretPath(user *User) string {
	return "Great Job " + user.Name
}

func PostLogin(req *http.Request, db *sql.DB, s sessions.Session) (int, string) {
	var id string

	email, password := req.FormValue("email"), req.FormValue("password")
	err := db.QueryRow("select id from users where email=$1 and password=$2", email, password).Scan(&id)

	if err != nil {
		return http.StatusUnauthorized, "Unauthorized"
	}

	s.Set("userId", id)
	return http.StatusOK, "User id is " + id
}

func RequireLogin(rw http.ResponseWriter, req *http.Request,
	s sessions.Session, db *sql.DB, c martini.Context) {
	user := &User{}
	err := db.QueryRow("select name, email from users where id=$1", s.Get("userid")).Scan(&user.Name, &user.Email)

	if err != nil {
		http.Redirect(rw, req, "/login", http.StatusFound)
		return
	}
	c.Map(user)
}

func Logout(rw http.ResponseWriter, req *http.Request, s sessions.Session) {
	s.Delete("userId")
	http.Redirect(rw, req, "/", http.StatusFound)
}
