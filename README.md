# Rails 6 template

This repo is a designed to be a Dockerized Rails 6 template:

  - [Docker](https://docs.docker.com/mac/started/)
  - [Rails 6](https://rubyonrails.org/)
  - [StimulusJS](https://github.com/stimulusjs/stimulus)
  - [Bulma](https://bulma.io/documentation)
  - [ActiveAdmin](https://activeadmin.info/)
  - [Devise](https://github.com/heartcombo/devise)

## Setup

  - `bundle`
  - `yarn install --check-files`
  - `Find/replace all TODO`
  - `docker-compose up --build`

### Dependencies

This service has dependencies on the following services.

1. Ruby 2.6.5
1. Rails 6.x
1. Postgres
1. Redis
1. Webpacker
1. Yarn
  1. [Stimulus](https://stimulusjs.org/handbook/installing#using-webpack)

### Docker
Follow the Docker [Getting Started](https://docs.docker.com/mac/started/) guide to get `docker`, `docker-machine` and `docker-compose`.  This project contains helper scripts to build, test, & push images to dockerhub.  

~~1. Build image: `$ script/build`~~
1. Run the test suite: `$ script/test`

### Docker Compose
Docker compose is used for Jenkins and local development.  Use the information below to configure each environment.

##### Local development
To start the application using docker compose locally:

1. Start the services: `$ docker-compose up --build`
1. Access via browser: `$ open http://localhost:3000`

### Environment Variables

| Variable       |  Description   | Default                 |
| ---------------|:---------------|:-----------------------:|
| `APP_NAME`     | App name       | app
| `APP_TITLE`     | App title      | TODO
| `DATABASE_URL`  | Database URL  | postgres://localhost:5432/app_development
| `DB_CONNECT_TIMEOUT` | Db connect timeout | 10
| `DB_MAX_CONNECTIONS` | Db Max Connections | 16
| `DB_MIN_CONNECTIONS` | Db Minimum Connections | 5
| `DB_SOCKET_TIMEOUT` | Db socket timeout | 5
| `DB_WAIT_QUEUE_TIMEOUT` | Db Wait queue timeout | 5
| `LOG_LEVEL`    | Log level      | warn
| `REDIS_URL`  | Redis Url   | redis://localhost:6379/0
| `SMTP_HOST`  | Smpt address   | `localhost`
| `SMTP_PORT`  | Smpt port   | 1025
| `WEBPACKER_HOST` | Webpacker host | `localhost`
| `WEBPACKER_DEV_SERVER_HOST` | Webpacker dev host | `0.0.0.0`

### TODO

- [ ] Heroku Procfile
