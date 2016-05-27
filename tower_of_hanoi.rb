class Tower
	def initialize(height)
		@tower_height = height
	end

	def create_gameboard
		counter = @tower_height
		@gameboard = [[],[],[]]
		@tower_height.times do |i|
			@gameboard[0] << "o" * counter
			counter -= 1
		end
	end

	#Introduce Users
	def introduction
		puts "Welcome to the Tower of Hanoi!"
		puts "Your tower will be #{@tower_height} discs high"
		puts "Enter where you'd like to move from and to "
		puts "in the format [1,3]. Enter q to quit."
	end

	#Display board
	def render

	end

	#check for invalid input
	def valid_input?(move)
		 if move.match(/^\[[1-3]\,[1-3]\]$/) != nil
		 	return true
		 else
		 	return false
		 end
	end

	#convert user input
	def convert_input(move)
		move = move.gsub(/\W/, '').split('').map! {|e| e.to_i}
		move[0] = move[0] - 1
		move[1] = move[1] - 1
	end

	#check for illegal move
	def valid_move?(move_array)
		if @gameboard[move_array[0]].empty?
			return false
		elsif @gameboard[move_array[1]].empty?
			return true
		elsif @gameboard[move_array[1]].empty? == false
			@gameboard[move_array[0]].last.length < move_array[move_array[1]].last.length
		else
			return false
		end
	end

	#Ask user to move
	def user_move
		puts "Where would you like to move?"
		loop do
			print ">"
			@move = gets.chomp
			break if valid_input?(@move)
			puts "Try again, your input should look like this: [1,3]"
		end
		loop do 
			@move = convert_input(@move)
			break if valid_move?(@move)
			puts "Try again, that is not a valid move."
			print ">"
			@move = gets.chomp
		end
		puts "Great, I'll move a disk from rod #{@move[0] + 1} to rod #{@move[1] + 1}"
	end

	#check for victory

	#Re-arrange board

	#display

	#if quit is type leave game
end

game = Tower.new(3)
game.introduction
game.create_gameboard
game.user_move
