class Product < ActiveRecord::Base
	validates_presence_of :title, :description, :price, :imagen_url 
	validates_numericality_of :price, :greater_than => 0.01
	validates_uniqueness_of :title
	validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i,:message => "check URL"
	validates_numericality_of :projection, :greater_than => 0 
end
