package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintln(w, "<h1>Привет мир</h1>")
    })

    fmt.Println("Запуск сервера на :8080...")
    http.ListenAndServe(":8080", nil)
}