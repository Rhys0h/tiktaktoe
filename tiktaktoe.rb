$board = []

def start_game
	$board = [[],[],[]], [[],[],[]], [[],[],[]]
	puts " --NEW GAME --"
	if rand(1..2) == 1
		puts "You move first, human"
		player_turn
	else
		puts "It is I, your computer, and the first turn belongs to me!"
		cpu_turn
	end
end

def cpu_turn
	puts "My turn"
	valid_move = false

	while valid_move == false
		a = rand(0..2)
		b = rand(0..2)

		if $board[a][b] == []			
			$board[a][b] = "O"
			valid_move = true
		end
	end

	show_board
	check_for_winner("Computers are SUPERIOOOOOR!")
	check_for_draw
	player_turn
end

def player_turn
	puts "Your turn. Choose your tile"
	tile = gets.chomp
	case tile
	when "7"
		$board[0][0] = "X" if $board[0][0] == []
	when "8"
		$board[0][1] = "X" if $board[0][1] == []
	when "9"
		$board[0][2] = "X" if $board[0][2] == []
	when "4"
		$board[1][0] = "X" if $board[1][0] == []
	when "5"
		$board[1][1] = "X" if $board[1][1] == []
	when "6"
		$board[1][2] = "X" if $board[1][2] == []
	when "1"
		$board[2][0] = "X" if $board[2][0] == []
	when "2"
		$board[2][1] = "X" if $board[2][1] == []
	when "3"
		$board[2][2] = "X" if $board[2][2] == []	
	end

	show_board
	check_for_winner("You have won. I am a disgrace to computerkind.")
	check_for_draw
	cpu_turn
end

def show_board
	$board.each do |i|
		p i
	end
end

def check_for_draw
	draw = true
	$board.each do |i|
		i.each do |x|
			if x == []
				draw = false
			end
		end
	end

	if draw
		puts "A pathetic draw"
		start_game
	end
end

def check_for_winner(winner_message)
	if [$board[0][0],$board[1][0],$board[2][0]].uniq.length == 1 && $board[0][0] != []
		puts winner_message
		start_game
	elsif [$board[0][1],$board[1][1],$board[2][1]].uniq.length == 1 && $board[0][1] != []
		puts winner_message
		start_game
	elsif [$board[0][2],$board[1][2],$board[2][2]].uniq.length == 1 && $board[0][2] != []
		puts winner_message
		start_game
	elsif [$board[1][0],$board[1][1],$board[1][2]].uniq.length == 1 && $board[1][0] != []
		puts winner_message
		start_game
	elsif [$board[0][2],$board[1][2],$board[2][2]].uniq.length == 1 && $board[0][2] != []
		puts winner_message
		start_game
	elsif [$board[2][0],$board[2][1],$board[2][2]].uniq.length == 1 && $board[2][0] != []
		puts winner_message
		start_game
	elsif [$board[0][0],$board[1][1],$board[2][2]].uniq.length == 1 && $board[0][0] != []
		puts winner_message
		start_game
	elsif [$board[0][2],$board[1][1],$board[2][0]].uniq.length == 1 && $board[0][2] != []
		puts winner_message
		start_game
	end
end


start_game