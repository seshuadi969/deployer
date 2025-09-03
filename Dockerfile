FROM php:8.3-cli-alpine

RUN apk add --no-cache bash git openssh-client rsync curl

# Download deployer.phar from official source
RUN curl -LO https://deployer.org/deployer.phar \
    && chmod +x deployer.phar \
    && mv deployer.phar /bin/dep

WORKDIR /app

CMD ["dep", "--version"]
