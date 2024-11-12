#!python3

# Extract specific unstructured data, presenting it in the structured format specified by the user.

    html_doc = BeautifulSoup(response.text, "html.parser")

    product_data.append({
        "title": html_doc.select_one("h2").get_text(),
        "price": html_doc.select_one(".price").get_text(),
        "developer": html_doc.select_one(".developer").get_text().replace("Developer: ", ""),
        "link": url.strip()
    })
