# Use lightweight PHP base image
FROM php:8.3-cli-alpine

# Install useful tools
RUN apk add --no-cache bash git openssh-client rsync curl

# Install Deployer (CLI tool)
RUN curl -LO https://deployer.org/deployer.phar \
    && chmod +x deployer.phar \
    && mv deployer.phar /bin/dep

# Set working directory
WORKDIR /app

# Copy your application code into container
COPY . /app

# Expose port 8080 inside container
EXPOSE 8080

# Start PHP built-in server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/app"]
