require 'open-uri'
require 'nokogiri'

namespace :task_one do
	task :receiv_category do
		path = 'http://www.tvdirect.tv/'
		html = open(path)
		page = Nokogiri::HTML(html)
		url=page.css("div#header-nav-custom.skip-content li.level0.sale a")[0]['href']
		Category.new(url)
		Category.save
  
		page.css("div#header-nav-custom.skip-content a.level0.has-children").each do |link|
			url=link['href']
			puts url
			puts link.text
		end
		page.css("div#header-nav-custom.skip-content a.level0").each do |link|
			url=link['href']
			puts url
			puts link.text
		end
	end
end