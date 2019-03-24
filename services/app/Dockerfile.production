FROM ruby:2.6.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  yarn \
  nodejs \
  vim \
  && rm -rf /var/lib/apt/lists/*

ENV PROJECT_ROOT /usr/src/app
ENV GEM_HOME $PROJECT_ROOT/vendor/bundle
ENV BUNDLE_PATH $PROJECT_ROOT/vendor/bundle

ENV NODE_ENV=production
ENV RAILS_ENV=production

RUN mkdir -p $PROJECT_ROOT

WORKDIR $PROJECT_ROOT

# Adding gems
COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install --jobs 20 --retry 5 --without development

COPY package.json .
COPY yarn.lock .

RUN yarn

# Adding project files
COPY . .
RUN chmod u+x bin/*
RUN SECRET_KEY_BASE=jopa bin/rails assets:precompile

# CMD bin/rails s
