# Tic Tac Toe CLI game in ruby

class tic_tac_toe

	def turn
		play = true 
		if intro 
			while play do 
				input_player_1
				if check_win 
					player_win(1)
					play = false
				end
				if play 
					input_player_2
					if check_win
						player_win(2)
						play = false
					end
				end
				if play && board_full
					tie_game
					play = false
				end
			end
			end
		end
		
		else
			puts "Thanks for playing! Goodbye."
	end

	def display_board(board)

	end

	def intro
		puts "Welcome to tic tac toe! Press 1 to play"
		result = gets.chomp
		if(result == 1) return true
		else return false 
		end
	end

	def check_win(player)
		win = false
		case board
		when board[1][1] == board[1][2] && board[1][1] == board[1][3]
			win = true
			break 
		when board[2][1] == board[2][2] && board[2][1] == board[2][3]
			win = true
			break
		when board[3][1] == board[3][2] && board[3][1] == board[3][3]
			win = true
			break
		when board[1][1] == board[2][1] && board[1][1] == board[3][1]
			win = true
			break
		when board[1][2] == board[2][2] && board[1][2] == board[3][2]
			win = true
			break
		when board[1][3] == board[2][3] && board[1][3] == board[3][3]
			win = true
			break
		when board[1][1] == board[2][2] && board[1][1] == board[3][3]
			win = true
			break
		when board[1][3] == board[1][2] && board[1][3] == board[3][1]
			win = true
		end

		if win 
			player_win(player)
		end
		
	end

	def valid_move?(row, column)
		if(board[row][column] == '')
			return true
		else
			return false
		end
	end

	def input_player_1
		valid_move = false
		while valid_move do 
			puts "Player 1: input the row you would like to move"
			row = gets.chomp
			puts "Player 1: input the column you would like to move"
			column = gets.chomp
			valid_move = valid_move?(row, column)
			if !valid_move 
				puts "Please enter a valid square that doesn't already contain a move"
			end
		end
		end
		board[row][column] = 'X'

	end

	def input_player_2
		valid_move = false
		while valid_move do 
			puts "Player 2: input the row you would like to move"
			row = gets.chomp
			puts "Player 2: input the column you would like to move"
			column = gets.chomp
			valid_move = valid_move?(row, column)
			if !valid_move 
				puts "Please enter a valid square that doesn't already contain a move"
			end
		end
		end
		board[row][column] = 'O'
	end

	def player_win(player)
		puts "Player #{player} wins!"
	end

	def tie_game

	end



	private

	board = [
				['','','']
				['','','']
				['','','']
			]

	turn_count = 0

end
