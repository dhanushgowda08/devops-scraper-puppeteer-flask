# DevOps Web Scraper with Node.js + Puppeteer + Python + Flask

##  Overview

This project demonstrates a multi-stage Docker build combining:

- **Node.js + Puppeteer**: For headless browser scraping
- **Python + Flask**: To serve the scraped data as a web API

It scrapes a given URL (provided via environment variable) and hosts the scraped content in a lightweight Python Flask server.

---

## Technologies Used

- **Node.js (18-slim)**
- **Puppeteer (headless Chromium browser)**
- **Python (3.10-slim)**
- **Flask** (minimal web server)
- **Docker Multi-Stage Build**

---

##  Project Structure

📁 devops-scraper/
├── scrape.js             # Puppeteer script (Node.js)
├── package.json          # Node dependencies
├── server.py             # Flask app (Python)
├── requirements.txt      # Python dependencies
├── Dockerfile            # Multi-stage Docker build
└── README.md             # This file!


##  How to Build the Docker Image

To build the Docker image, run the following command in your project directory (where the Dockerfile is located):

```bash
docker build -t devops-scraper .



##  How to Run the Container

To run the container and scrape a website (e.g., https://example.com), use the following command:

```bash
docker run -e SCRAPE_URL=https://example.com -p 5000:5000 devops-scraper


##  Project Structure

devops-scraper/ ├── Dockerfile # Multi-stage Docker build (Node.js + Python) 
├── scrape.js # Node.js script using Puppeteer to scrape a given URL 
├── server.py # Python Flask server that serves the scraped JSON data 
├── package.json # Node.js dependencies 
├── requirements.txt # Python dependencies
└── README.md # Documentation (this file)

##  Summary & Notes

- This project demonstrates a clean separation of concerns:
  - **Node.js + Puppeteer** for web scraping
  - **Python + Flask** for serving the scraped data
- It uses **multi-stage Docker builds** to keep the final image lean.
- You can customize the scraped URL by passing it via the `SCRAPE_URL` environment variable when running the container.

###  Example Use Case

You can use this setup to:
- Periodically scrape headlines or metadata from news websites
- Extract and serve lightweight previews for any URL
- Demonstrate browser automation combined with API hosting in a compact, containerized format


