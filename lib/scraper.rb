require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    html = Nokogiri::HTML(open(index_url))

    html.css("div.roster-cards-container").each do |elem|
      elem.css(".student-card a").each do |student|
        name = student.css(".student-name").text
        location = student.css(".student-location").text
        profile = "#{student.attr("href")}"

        students << { name: name, location: location, profile_url: profile }
      end
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
