# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
# require "active_storage/engine"
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require "action_mailbox/engine"
# require "action_text/engine"
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  module Config
    APP_NAME = 'app' # TODO: Update name
    APP_TITLE = 'TODO: Update in config/application.rb'
    DATABASE_URL = ENV.fetch('DATABASE_URL') { "postgres://localhost:5432/#{APP_NAME}_#{Rails.env}" }
    REDIS_URL = ENV.fetch('REDIS_URL') { 'redis://localhost:6379/0' }
    SMTP_HOST = ENV.fetch('SMTP_HOST') { 'localhost' }
    SMTP_PORT = ENV.fetch('SMTP_PORT') { 1025 }
  end

  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # System-wide settings
    # mail settings
    config.action_mailer.default_url_options = { host: App::Config::SMTP_HOST }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = { address: App::Config::SMTP_HOST, port: App::Config::SMTP_PORT }

    # https://github.com/redis-store/redis-rails#rails-fragment-cache
    config.cache_store = :redis_store, App::Config::REDIS_URL, { expires_in: 90.minutes }

    # https://github.com/mperham/sidekiq/wiki/Active-Job#active-job-setup
    config.active_job.queue_adapter = :sidekiq

    # In order for logs to function properly,
    # Docker expects your application or process to log to STDOUT
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.log_tags  = %i[subdomain uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
end
