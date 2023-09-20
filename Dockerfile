FROM ruby:3.1

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT

ENTRYPOINT ["bundle"]
CMD ["exec", "puma", "-C", "puma.rb"]