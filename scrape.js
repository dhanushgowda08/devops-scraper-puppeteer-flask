import puppeteer from 'puppeteer';
import fs from 'fs';

const url = process.env.SCRAPE_URL || 'https://example.com';

const scrape = async () => {
  const browser = await puppeteer.launch({
    headless: true,
    executablePath: '/usr/bin/chromium',
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
  });

  const page = await browser.newPage();
  await page.goto(url);

  const title = await page.title();
  const heading = await page.$eval('h1', el => el.textContent).catch(() => 'No <h1> found');

  const result = { title, heading };

  fs.writeFileSync('scraped_data.json', JSON.stringify(result, null, 2));

  await browser.close();
};

scrape();
