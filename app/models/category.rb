class Category < ActiveRecord::Base
has_many :products
acts_as_nested_set
validates :url, :format => URI::regexp(%w(http https))
end
