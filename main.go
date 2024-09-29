package main

import (
	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/template/html/v2"
)

func main() {
	// Создание нового приложения Fiber
	app := fiber.New(fiber.Config{
		Views: html.New("./views", ".html"),
	})

	// Определение маршрутов
	app.Get("/", func(c *fiber.Ctx) error {
		return c.Render("index", fiber.Map{
			"Title": "Главная страница",
		})
	})

	app.Get("/dynamic", func(c *fiber.Ctx) error {
		return c.SendString("<p>Это динамически загруженный контент!</p>")
	})
	// Запуск приложения
	err := app.Listen(":1488")
	if err != nil {
		panic(err) // Если есть ошибка, выводим ее
	}
}
