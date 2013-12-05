class Database
	@items = []
	
	@exceptions = ["chocolate bar","book","pills"]
	@tax_free = @exceptions.to_s
	
	@to_tax = ["music","perfume"]
	@taxable = @to_tax.to_s
	
	def self.basket
		@basket
	end

	def self.items(item)
		@items << item
	end

	def self.display_items
		@items.each do |item|
			@input_quantity = "#{item.item_quantity}"
			@input_name = "#{item.item_name}"	
			@input_price = "#{item.item_price}"
			@price = @input_price.to_i

		if @input_name.include?("imported") 
			@import_price = (@price * 0.05) + @price
			puts "#{@input_quantity } #{@input_name}: #{@import_price}"
		elsif @input_name.include?("m")
			@taxed_price = (@price * 0.10) + @price
			puts "#{@input_quantity} #{@input_name}: #{@taxed_price}"
		else
			puts "#{@input_quantity} #{@input_name}: #{@price}"
		end


		end



		# @items.index do |item|
		# 	puts "#{item.item_quantity} #{item.item_name}: #{item.item_price}"
		# end

	end
end