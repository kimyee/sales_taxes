require "./database"
require "./item"
require "./basket"

class Sales_taxes
	def main_menu
		menu_options
		@user_menu_input = gets.to_i
		menu_call_option(@user_menu_input)
		while @user_menu_input != 3
			main_menu
		end 
	end

	def menu_options
		puts " "
		puts "~~~~~~ Main Menu ~~~~~~~"
		puts "[1] Create a basket"
		puts "[3] Exit"
		puts "Enter the number corresponding to the action you wish to perform: "
	end

	def menu_call_option(user_menu_input)
		new_basket if user_menu_input == 1
		view_baskets if user_menu_input == 2
		exit if user_menu_input == 3
	end
	
	def new_basket
		basket = Basket.new(@user_menu_input)
		Database.basket
		puts " "
		puts "--A new basket has been created!--"
		basket_options
		@user_basket_input = gets.to_i
		basket_call_option(@user_basket_input)
	end

	def basket_options
		puts " "
		puts "~~~~~~~~~~~ Basket ~~~~~~~~~~~"
		puts "[1] Add an item to your basket"
		puts "[2] Print receipt"
		puts "[3] Reutrn to the main menu"
		puts "Enter the number corresponding to the action you wish to perform: "
	end

	def basket_call_option(user_basket_input)
		add_new_item if user_basket_input == 1
		current_basket_receipt if user_basket_input == 2
		main_menu if user_basket_input == 3
	end

	def add_new_item
		puts " "
		puts "~~~~~~~~~~ Item Info ~~~~~~~~~~~"
		print "Enter the item (ex: book): "
		item_name = gets.chomp
		print "Enter the quantity of the item: "
		item_quantity = gets.chomp
		print "Enter the price of the item (without the $ symbol): "
		item_price = gets.chomp
		item = Item.new(item_quantity, item_name, item_price)
		Database.items(item)
		puts " "
		puts "-- Item added --"
		puts " "
		basket_options
		@user_basket_input = gets.to_i
		basket_call_option(@user_basket_input)
	end

	def current_basket_receipt
		puts " "
		puts "~~~~~~~~~~ Your Receipt ~~~~~~~~~~"
		Database.display_items
		puts " "
		basket_options
		@user_basket_input = gets.to_i
		basket_call_option(@user_basket_input)
	end
end

receipt_app = Sales_taxes.new
receipt_app.main_menu