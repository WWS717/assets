#!python3

# === url_crawler.py === #
import requests
from bs4 import BeautifulSoup


urls = []

for page in range(1,999):
    print(f"Scraping Webpage {page}.")
    response = requests.get(f"https://invoice.statrys.com/?page={page}")
    html_doc = BeautifulSoup(response.text, "html.parser")

    for product in html_doc.find_all("div", class_="product-card"):
        link = product.select_one("a")
        urls.append("https://mdbootstrap.com" + link.get("href"))

with open("urls.txt", "w") as f:
    for url in urls:
        f.write(url + "\n")
print("URLs saved to a file.")
