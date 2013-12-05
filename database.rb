class Database
	@items = []
	
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
			@price = @input_price.to_f.round(2)

		if @input_name.include?("imported") && @input_name.include?("music") || @input_name.include?("perfume")
			@import_taxed = (@price * 0.15) + @price
			puts "#{@input_quantity } #{@input_name}: #{@import_taxed.round(2)}"
		elsif @input_name.include?("imported") 
			@import_price = (@price * 0.05) + @price
			puts "#{@input_quantity } #{@input_name}: #{@import_price.round(2)}"
		elsif @input_name.include?("music") || @input_name.include?("perfume")
			@taxed_price = (@price * 0.10) + @price
			puts "#{@input_quantity} #{@input_name}: #{@taxed_price.round(2)}"
		else
			puts "#{@input_quantity} #{@input_name}: #{@price.round(2)}"
		end

		# @price if @price != nil
		# @taxed_price if @taxed_price != nil
		# @import_price if @import_price != nil

		# if @price != nil && @taxed_price != nil && @import_price != nil && @import_taxed != nil
		# 	print "Total: "
		# 	print @price + @taxed_price + @import_price + @import_taxed
		# elsif @price !=nil && @taxed_price != nil
		# 	print "Total: "
		# 	print @price + @taxed_price
		# elsif @import_taxed != nil && @taxed_price != nil
		# 	print "Total: "	
		# 	print @import_taxed + @import_price
		# end

		# if @price != nil && @taxed_price != nil
		# 	puts "Total: "
		# 	puts @price + @taxed_price
		# end

		end



		# @items.index do |item|
		# 	puts "#{item.item_quantity} #{item.item_name}: #{item.item_price}"
		# end

	end
end