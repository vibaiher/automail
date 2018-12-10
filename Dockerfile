FROM ruby:2.5.3-alpine AS base

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

ENV APP /opt/automail
WORKDIR $APP

COPY . .
RUN bundle install

ENV PATH="/opt/automail/exe:${PATH}"
RUN bundle exec rake install

CMD ["automail"]
