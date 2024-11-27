package config

import (
	"github.com/gofiber/fiber/v2"
	"github.com/sirupsen/logrus"
	"github.com/spf13/viper"
	"gorm.io/gorm"
)

type BootstrapConfig struct {
	Db     *gorm.DB
	App    *fiber.App
	Log    *logrus.Logger
	Config *viper.Viper
}

func Bootstrap(config *BootstrapConfig) {

}
