class Order < ActiveRecord::Base
	def self.search(search)
	  where("order_id ILIKE ?", "%#{search}%")
	end
	def self.filter(filter)
		where(c_date: filter)
 	end

 	def self.daily(filter)
		where("status_time ILIKE ?", "%#{filter}%")
 	end
end
