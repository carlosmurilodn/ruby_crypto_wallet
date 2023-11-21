FROM ruby:3.1.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs \
    npm        
COPY . .
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]