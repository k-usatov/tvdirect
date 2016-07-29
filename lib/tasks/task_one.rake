require 'open-uri'
require 'nokogiri'

namespace :task_one do
	task :receiv_category => :environment do
		path = 'http://www.tvdirect.tv/?___store=en&___from_store=th'
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
			category.parent_id=category.title
			category.save
						
			page.css("div#header-nav-custom.skip-content a.level1.has-children").each do |link1|
				category.url = link1['href']
				category.title=link1.text		
				category.save				
			end
		end
		
		category.save
	
	end
end