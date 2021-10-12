require 'nokogiri'
require 'open-uri'

def scrape_etsy(keyword)
  # filepath = "/Users/dougberks/code/dmbf29/fullstack-challenges/01-Ruby/06-Parsing/Reboot-01-Christmas-list/lib/results.html"
  # 1. We get the HTML page content
  # html_content = File.open(filepath)
  html_content = URI.open("https://www.etsy.com/search?q=#{keyword}").read
  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(html_content)
  # TODO: after EVERTHING works, then change the file to the URL

  etsy_list = {}
  doc.search('.v2-listing-card .v2-listing-card__title').first(5).each do |element|
    item = element.text.strip.split.first(6).join(' ')
    etsy_list[item] = false
  end
  etsy_list
end
