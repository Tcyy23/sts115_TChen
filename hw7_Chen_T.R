# emf - great!

library(httr)
library(jsonlite)
library(xml2) # package for parsing xml documents
library(rvest) # package for web scraping
library(stringr)

url = "https://theaggie.org/category/features/"
doc = read_html(url)
xml_find_all(doc, "//div[contains(@class, 'td_block_inner')]")

parse_article_links = function(page) {
  # Get article URLs
  div = xml_find_all(page, "//div[@id = 'tdi_74']") # Error, The id in the website has change from 113 to 74
  
  links = xml_find_all(div, ".//h3/a")
  urls = xml_attr(links, "href")
  title = xml_attr(links, "title")
  
  # Get next page URL
  nav = xml_find_all(page, "//div[contains(@class, 'page-nav')]")
  next_page = xml_find_all(nav, ".//a[contains(@aria-label, 'next-page')]")
  if (length(next_page) == 0) {
    next_url = NA
  } else {
    next_url = xml_attr(next_page, "href")
  }
  
  # Using a list allows us to return two objects
  list(urls = urls, next_url = next_url)
}

# NOTE: This code is likely to take a while to run, and is meant more for
# reading than for you to run and try out.

url = "https://theaggie.org/category/features/"
article_urls = list()
i = 1

# On the last page, the next URL will be `NA`.
while (!is.na(url) && i <= 5) { # Modify it so it loop only for 5 pages
  # Download and parse the page.
  page = read_html(url)
  result = parse_article_links(page)
  
  # Save the article URLs in the `article_urls` list. The variable `i` is the
  # page number.
  article_urls[[i]] = result$url
  i = i + 1
  
  # Set the URL to the next URL.
  url = result$next_url
  
  # Sleep for 1/30th of a second so that we never make more than 30 requests
  # per second.
  Sys.sleep(1/30)
}

#Print out the url from the website
print(article_urls)
