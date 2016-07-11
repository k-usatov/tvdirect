class Product < ActiveRecord::Base
belongs_to :category

validates :url, :format => URI::regexp(%w(http https))
end