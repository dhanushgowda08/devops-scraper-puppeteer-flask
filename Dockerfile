# Scraper Stage
FROM node:18-slim AS scraper

# Puppeteer dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    wget \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Accept URL as build ARG
ARG SCRAPE_URL
ENV SCRAPE_URL=${SCRAPE_URL}

WORKDIR /app

COPY package.json ./
RUN npm install

COPY scrape.js ./

# Run the scraper
RUN node scrape.js

# Step 2: Flask Web Server Stage (Python)
FROM python:3.10-slim AS server

WORKDIR /app

# Copy scraped data from scraper stage
COPY --from=scraper /app/scraped_data.json ./scraped_data.json

# Copy server files
COPY server.py ./
COPY requirements.txt ./

# Install Flask
RUN pip install -r requirements.txt

# Expose the port
EXPOSE 5000

# Run the Flask server
CMD ["python", "server.py"]