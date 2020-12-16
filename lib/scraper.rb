require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    html = Nokogiri::HTML(open(index_url))

    html.css("div.roster-cards-container").each do |elem|
      elem.css(".student-card a").each do |student|
        profile = "#{student.attr("href")}"
        location = student.css(".student-location").text
        student_name = student.css('.student-name').text
        students << {name: student_name, location: student_location, profile_url: student_profile_link}
      end
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end
