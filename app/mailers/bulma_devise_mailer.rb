# frozen_string_literal: true

class BulmaDeviseMailer < Devise::Mailer
  default from: App::Config::DEFAULT_EMAIL
  layout 'mailer'
end
