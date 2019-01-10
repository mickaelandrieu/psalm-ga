FROM php:7.3-alpine

LABEL "com.github.actions.name"="psalm"
LABEL "com.github.actions.description"="psalm"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/mickaelandrieu/psalm-ga"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Mickaël Andrieu <mickael.andrieu@prestashop.com>"

#
# Updated version of phpqa/psalm Docker image.
#

# Install Tini - https://github.com/krallin/tini

RUN apk add --no-cache tini

COPY --from=composer:1.8 /usr/bin/composer /usr/bin/composer
RUN COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME="/composer" \
    composer global require --prefer-dist --no-progress --dev vimeo/psalm:3.0.10

ENV PATH /composer/vendor/bin:${PATH}

# Satisfy Psalm's quest for a composer autoloader (with a symlink that disappears once a volume is mounted at /app)

RUN mkdir /app && ln -s /composer/vendor/ /app/vendor

# Add entrypoint script

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Package container

WORKDIR "/app"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["psalm"]