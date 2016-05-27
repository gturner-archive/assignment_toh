class Tower
	
	@victory = false

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
		move = move.map do |rod|
			if rod > 1
				rod - 1
			elsif rod == 1
				rod = 0		
			end
		end
	end

	#check for illegal move
	def valid_move?(move_array)
		if @gameboard[move_array[0]] == @gameboard[move_array[1]]
			return false
		elsif @gameboard[move_array[0]].empty?
			return false
		elsif @gameboard[move_array[1]].empty?
			return true
		elsif @gameboard[move_array[1]].empty? == false
			@gameboard[move_array[0]].last.length < move_array[move_array[1]].last.length
		else
			return false
		end
	end

	#check for victory
	def victory_check
		@gameboard.each_with_index do |rod_contents, rod|
			if rod_contents.length == @tower_height && rod != 0
				puts "You Win"
				return @victory = true
			end
		end
	end

	#Ask user to move
	def user_move
		puts "Where would you like to move?"
		loop do
			print "> "
			@move = gets.chomp
			if @move.downcase == "quit"
				exit
			elsif valid_input?(@move)
				@move = convert_input(@move)
				if valid_move?(@move)
					break
				else
					puts "Try again, that is not a valid move."
				end
			else
			puts "Try again, your input should look like this: [1,3]"
			end	
		end
		puts "Great, I'll move a disk from rod #{@move[0] + 1} to rod #{@move[1] + 1}"
	end

	#Re-arrange board
	def arrange_board
		ring = @gameboard[@move[0]].pop
		@gameboard[@move[1]] << ring
		p @gameboard
	end

	def play
		introduction
		create_gameboard
		until @victory
			user_move
			arrange_board
			#render
			victory_check
		end
	end

	

	#display

	#if quit is type leave game
end

game = Tower.new(3)
game.play
