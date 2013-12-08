class Item
	attr_accessor :item_quantity, :item_name, :item_price
	def initialize(item_quantity, item_name, item_price)
		@item_quantity = item_quantity
		@item_name = item_name
		@item_price = item_price
	end
end