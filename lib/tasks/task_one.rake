require 'open-uri'
require 'nokogiri'

namespace :task_one do
	task :receiv_category => :environment do
		path = 'http://www.tvdirect.tv/'
		html = open(path)
		page = Nokogiri::HTML(html)
		
		tmp = page.css("div#header-nav-custom.skip-content li.level0.sale a")
		category = Category.new
		category.url = tmp[0]['href']
		category.title = tmp[0].text
		category.save
		
		page.css("div#header-nav-custom.skip-content a.level0").each do |link|
			category = Category.new
			category.url=link['href']
			category.title=link.text
			category.save
		end
				
		page.css("div#header-nav-custom.skip-content a.level0.has-children").each do |link|
			category = Category.new
			category.url=link['href']
			category.title=link.text
			category.save
		end
		
		category.save
	
	end
end