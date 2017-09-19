WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if (board[index] == " " || board[index] == nil) && [0..8].include?(index)
    true
  else
    false
  end
end

def turn
end

def turn_count
end

def current_player
end



def won?(board)
  if board.all? {|pos| pos == " " || pos == nil}
    return false
  end

  WIN_COMBINATIONS.each do |arr|
    if position_taken?(board, arr[0]) && board[arr[0]] == board[arr[1]] && board[arr[1]] == board[arr[2]]
      return arr
    end
  end
  false
end

def full?(board)
  board.all? {|pos| pos != " " && pos != nil}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  false
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board)
    newarr = won?(board)
    return board[newarr[0]]
  end
end
