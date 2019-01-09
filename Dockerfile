FROM php:7.3-alpine

LABEL "com.github.actions.name"="psalm"
LABEL "com.github.actions.description"="psalm"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/mickaelandrieu/psalm-ga"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Mickaël Andrieu <mickael.andrieu@prestashop.com>"

RUN wget https://github.com/vimeo/psalm/releases/download/3.0.10/psalm.phar -O psalm \
    && chmod a+x psalm \
    && mv psalm /usr/local/bin/psalm

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]