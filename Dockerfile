# Use Debian-based Node image
FROM node:20-bullseye

# Set working directory
WORKDIR /app

# Copy Wisecow script
COPY wisecow.sh .

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        cowsay \
        fortune-mod \
        fortunes-min \
        netcat && \
    chmod +x wisecow.sh && \
    rm -rf /var/lib/apt/lists/*

# Expose port
EXPOSE 4499

# Run Wisecow script
CMD ["./wisecow.sh"]
