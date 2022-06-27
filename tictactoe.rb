# Tic Tac Toe CLI game in ruby

class TicTacToe

	#turn will cycle through each players turn and check after each turn
	#if a player has won a game before reiterating another round
	def turn
		play = true 
			while play
				input_player_1
				if check_win?(1)
					player_win(1)
					play = false
				end
				if play 
					input_player_2
					if check_win?(2)
						player_win(2)
						play = false
					end
				end
				if play && board_full
					puts "Board has been filled.. tie game!"
					play = false
				end
			
			end
	end

	#displays the 3x3 tic tac toe board with all the current moves
	def display_board
		puts "Current board is: "
		puts " #{@@board[0][0]} | #{@@board[0][1]} | #{@@board[0][2]}" 
		puts " #{@@board[1][0]} | #{@@board[1][1]} | #{@@board[1][2]}" 
		puts " #{@@board[2][0]} | #{@@board[2][1]} | #{@@board[2][2]}" 
	end

	#asks user if they would like to play tic tac toe
	# def intro
	# 	puts "Welcome to tic tac toe! Press 1 to play"
	# 	result = gets.chomp
	# 	if result == 1 return true
	# 	else return false 
	# 	end
	# end

	#will check if any of the 8 winning combinations is
	#currently on the board
	#if so will announce the winner as the current plyer that was
	#passed in
	def check_win?(player)
		win = false
		case @@board
		when @@board[0][0] == @@board[0][1] && @@board[0][0] == @@board[0][2]
			win = true
		when @@board[1][0] == @@board[1][1] && @@board[1][0] == @@board[1][2]
			win = true
		when @@board[2][0] == @@board[2][1] && @@board[2][0] == @@board[2][2]
			win = true
		when @@board[0][0] == @@board[1][0] && @@board[0][0] == @@board[2][0]
			win = true
		when @@board[0][1] == @@board[1][1] && @@board[0][1] == @@board[2][1]
			win = true
		when @@board[0][2] == @@board[1][2] && @@board[0][2] == @@board[2][2]
			win = true 
		when @@board[0][0] == @@board[1][1] && @@board[0][0] == @@board[2][2]
			win = true
		when @@board[0][2] == @@board[1][1] && @@board[0][2] == @@board[2][0]
			win = true
		end

		if win 
			player_win(player)
		end

		return win
		
	end

	#Will determine if the current move requested by the player is valid
	def valid_move?(row, column)
		if(@@board[row][column] == ' ')
			return true
		else
			return false
		end
	end

	#Takes input from the current player
	def input_player_1
		display_board
		valid_move = false
		while !valid_move 
			puts "Player 1: input the row you would like to move"
			row = gets.chomp.to_i - 1
			puts "Player 1: input the column you would like to move"
			column = gets.chomp.to_i - 1
			valid_move = valid_move?(row, column)
			if !valid_move 
				puts "Please enter a valid square that doesn't already contain a move"
			end
		end
		@@board[row][column] = 'X'

	end

	def input_player_2
		display_board
		valid_move = false
		while !valid_move
			puts "Player 2: input the row you would like to move"
			row = gets.chomp.to_i - 1
			puts "Player 2: input the column you would like to move"
			column = gets.chomp.to_i - 1	
			valid_move = valid_move?(row, column)
			if !valid_move 
				puts "Please enter a valid square that doesn't already contain a move"
			end
		end
		
		@@board[row][column] = 'O'
	end

	#announces current player as winner
	def player_win(player)
		puts "Player #{player} wins!"
	end

	#board has been filled and therefore is a tied game
	def board_full
		empty_board = true
		@@board.each do |row| 
			row.each do |space|
				if space == ' '
					empty_board = false
				end
			end
		end
		return empty_board

	end


	@@board = [
			[' ',' ',' '],
			[' ',' ',' '],
			[' ',' ',' ']
			]

	@@turn_count = 0
end



current_board = TicTacToe.new()
current_board.turn