require 'debugger'

class Database
	@items = []
	@total = []
	@sales_taxes = []
	
	def self.basket
		@basket
	end

	def self.items(item)
		@items << item
	end

	def self.display_items
		@items.map do |item|
			@input_quantity = "#{item.item_quantity}"
			@input_name = "#{item.item_name}"	
			@input_price = "#{item.item_price}"
			@price = @input_price.to_f

			if @input_name.include?("imported") && @input_name.include?("music") || @input_name.include?("imported") && @input_name.include?("perfume")
				@import_taxed = (@price * 0.15) + @price
				@total << @import_taxed
				@sales_taxes << @import_taxed - @price
				puts "#{@input_quantity } #{@input_name}: #{'%.2f' % @import_taxed}"
			elsif @input_name.include?("imported") 
				@import_price = (@price * 0.05) + @price
				@total << @import_price
				@sales_taxes << @import_price - @price
				puts "#{@input_quantity } #{@input_name}: #{'%.2f' % @import_price}"
			elsif @input_name.include?("music") || @input_name.include?("perfume")
				@taxed_price = (@price * 0.10) + @price
				@total << @taxed_price
				@sales_taxes << @taxed_price - @price
				puts "#{@input_quantity} #{@input_name}: #{'%.2f' % @taxed_price}"
			else
				@total << @price
				puts "#{@input_quantity} #{@input_name}: #{'%.2f' % @price}"
			end
		end

		if @price == nil
			@price.to_f
		end
		if @taxed_price == nil
			@taxed_price.to_f
		end
		if @import_price == nil
			@import_price.to_f
		end
		if @import_taxed == nil
			@import_taxed.to_f
		end
		print "Sales Taxes: "
		puts "%.2f" % @sales_taxes.inject(:+)

		print "Total: "
		print "%.2f" % @total.inject(:+)

			
	end
end