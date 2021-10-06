# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.6.5'

gem 'bootsnap',          '>= 1.4', require: false
gem 'jbuilder',          '~> 2.9'
gem 'lograge',           '~> 0.11'
gem 'multi_json',        '~> 1.14'
gem 'paranoia',          '~> 2.4'
gem 'pg',                '~> 1.2'
gem 'puma',              '~> 4.2'
gem 'rails',             '~> 6.0'
gem 'redis-rails',       '~> 5.0'
gem 'responders',        '~> 3.0'
gem 'sidekiq',           '~> 6.2'
gem 'simple_form',       '~> 5.0'
gem 'validates_email_format_of', '~> 1.6'
gem 'webpacker', '~> 4.2'

# auth
gem 'activeadmin', '~> 2.6'
gem 'arctic_admin'
gem 'devise', '~> 4.7'

# styles
gem 'bulma-rails', '~> 0.8.0'
gem 'premailer-rails', '~> 1.11'

group :development, :test do
  gem 'factory_bot_rails',  '~> 5.1'
  gem 'faker',              '~> 2.10'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.9'
  gem 'rubocop'
  gem 'rubocop-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0'
end

group :test do
  gem 'database_cleaner', '~> 1.7'
  gem 'json_spec',        '~> 1.1'
  gem 'mock_redis',       '~> 0.17'
  gem 'rspec-sidekiq',    '~> 3.0'
  gem 'shoulda-callback-matchers', '~> 1.1'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', '~> 0.16'
end
