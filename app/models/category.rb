class Category < ActiveRecord::Base
has_many :products

validates :url, :format => URI::regexp(%w(http https))
end
