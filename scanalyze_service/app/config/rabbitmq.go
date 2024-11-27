package config

import (
	amqp "github.com/rabbitmq/amqp091-go"
	"github.com/sirupsen/logrus"
	"github.com/spf13/viper"
)

func NewRabbitMQConsumer(config *viper.Viper, log *logrus.Logger) (*amqp.Channel, amqp.Queue) {
	conn, err := amqp.Dial(config.GetString("rabbitmq.url"))
	if err != nil {
		log.Fatalf("Failed to connect to RabbitMQ: %v", err)
	}

	ch, err := conn.Channel()
	if err != nil {
		log.Fatalf("Failed to open a channel: %v", err)
	}

	q, err := ch.QueueDeclare(
		config.GetString("rabbitmq.queue"), // name
		true,                               // durable
		false,                              // delete when unused
		false,                              // exclusive
		false,                              // no-wait
		nil,                                // arguments
	)
	if err != nil {
		log.Fatalf("Failed to declare a queue: %v", err)
	}

	return ch, q
}

func NewRabbitMQProducer(config *viper.Viper, log *logrus.Logger) (*amqp.Channel, amqp.Queue) {
	conn, err := amqp.Dial(config.GetString("rabbitmq.url"))
	if err != nil {
		log.Fatalf("Failed to connect to RabbitMQ: %v", err)
	}

	ch, err := conn.Channel()
	if err != nil {
		log.Fatalf("Failed to open a channel: %v", err)
	}

	q, err := ch.QueueDeclare(
		config.GetString("rabbitmq.queue"), // name
		true,                               // durable
		false,                              // delete when unused
		false,                              // exclusive
		false,                              // no-wait
		nil,                                // arguments
	)
	if err != nil {
		log.Fatalf("Failed to declare a queue: %v", err)
	}

	return ch, q
}
