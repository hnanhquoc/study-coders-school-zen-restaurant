class FoodItem < ApplicationRecord
	belongs_to :section
	has_many :orders

	def promo_price
		price * (100 - sale)/100
	end

	def image_url_or_default
		if !image_url.nil? && !image_url.blank?
			image_url
		else
			"http://loremflickr.com/320/240/#{name .gsub(' ', '')}"
		end
	end

	def self.search(search)
		where("name ILIKE ?", "%#{search}%") 
	end
end
