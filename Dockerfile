# https://pkgs.alpinelinux.org/packages?name=ruby&branch=v3.11
FROM ruby:2.6.5-alpine3.11

ENV BUNDLER_VERSION=2.0.2

# Minimal requirements to run a Rails app
RUN apk add --no-cache --update build-base \
                                linux-headers \
                                postgresql-dev \
                                nodejs \
                                tzdata \
                                git \
                                less \
                                chromium \
                                chromium-chromedriver \
                                yarn

WORKDIR /app
COPY Gemfile* ./

# Bundler workaround
# https://stackoverflow.com/a/58102398
RUN gem update --system
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle install --jobs 5 --retry 5

# Copy the application into the container
COPY . .

# Precompile Rails assets
# RUN bundle exec rake assets:clean assets:precompile

# Start puma
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
