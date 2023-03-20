# Create a Jekyll container from a Ruby Alpine image

FROM ruby:alpine3.17


# Add Jekyll dependencies to Alpine
RUN apk update
RUN apk add --no-cache build-base gcc cmake git libxml2-dev libxslt-dev libc6-compat

RUN gem update --system 
RUN gem install jekyll bundler


RUN gem cleanup

EXPOSE 4000
EXPOSE 35729

VOLUME [ "/site", "/usr/local/bundle" ]

WORKDIR /site

CMD ["jekyll", "--help"]
