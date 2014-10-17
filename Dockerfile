FROM gorsuch/rubybox
MAINTAINER Michael Gorsuch <michael.gorsuch@gmail.com>

ADD . /app
WORKDIR /app
RUN bundle
CMD bundle exec libratod
