require 'open-uri'
require 'nokogiri'
namespace :task_one do
  task :receiv_category => :enviroment do
	require 'open-uri'
	require 'nokogiri'

	path = 'http://www.tvdirect.tv/'
	html = open(path)
	doc = Nokogiri::HTML(html)

	nav_primarys = []
		doc.css('.nav_primary').each do |nav_primarys|
			url = nav-primary.css('.nav-primary a').map { |link| link['href'] }
			nav_primarys.push(
			url: url
			)
		end
	end
  end