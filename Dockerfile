FROM php:8.3-cli-alpine

# Install required tools
RUN apk add --no-cache bash git openssh-client rsync curl

# Install Deployer CLI
RUN curl -LO https://deployer.org/deployer.phar \
    && chmod +x deployer.phar \
    && mv deployer.phar /bin/dep

# Workdir
WORKDIR /app

# Copy project files
COPY . /app

# Start PHP server serving /app
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/app"]
