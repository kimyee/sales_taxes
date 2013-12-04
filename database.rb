class Database
	@items = []

	def self.basket
		@basket
	end

	def self.items(item)
		@items << item
	end

	def self.display_items
		@items.index do |item|
			puts "#{item.item_quantity} #{item.item_name}: #{item.item_price}"
		end
	end
end