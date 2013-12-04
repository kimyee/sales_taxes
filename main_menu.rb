class Main_menu
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
		puts "[1] Create a new basket"
		puts "[2] Print Receipt of all baskets"
		puts "[3] Exit"
		puts "Enter the number corresponding to the action you wish to perform: "
	end

	def menu_call_option(user_menu_input)
		new_basket if user_menu_input == 1
		view_baskets if user_menu_input == 2
		exit if user_menu_input == 3
	end
end
