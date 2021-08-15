FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y build-essential \
  postgresql-client 

# for postgres
RUN apt-get install -y libpq-dev

WORKDIR /expense_control

ADD Gemfile /expense_control/Gemfile
ADD Gemfile.lock /expense_control/Gemfile.lock

RUN bundle install
ADD . /expense_control

CMD ["rails", "server", "--binding", "0.0.0.0"]

