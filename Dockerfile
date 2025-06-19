# Stage 1: Сборка Go-бинарника
FROM golang:1.22 as builder

WORKDIR /app
COPY main.go .

# Компилируем статически
RUN CGO_ENABLED=0 go build -o /server -ldflags "-s -w" main.go

# Stage 2: Финальный образ
FROM gcr.io/distroless/static-debian12

# Копируем бинарник
COPY --from=builder /server /server

# Открываем порт
EXPOSE 8080

# Запускаем приложение
ENTRYPOINT ["/server"]