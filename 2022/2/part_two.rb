path = 'advent_of_code/2022/2/input.txt'

total_score = 0

# Helpers
def calculate_score(player_item, game_status)
  item_points = { 'rock': 1, 'paper': 2, 'scissors': 3 }
  status_points = { 'win': 6, 'lose': 0, 'draw': 3 }

  item_points[player_item.to_sym] + status_points[game_status.to_sym]
end

def win?(player_item, opponent_item)
  win_cases = { 'rock': 'scissors', 'scissors': 'paper', 'paper': 'rock' }

  win_cases[player_item.to_sym] == opponent_item
end

def draw?(player_item, opponent_item)
  player_item == opponent_item
end

def match_item(key)
  keys = { 'A': 'rock', 'B': 'paper', 'C': 'scissors' }

  keys[key.to_sym]
end

def match_game_status(key)
  keys = { 'X': 'lose', 'Y': 'draw', 'Z': 'win' }

  keys[key.to_sym]
end

def player_item(opponent_item, match_status)
  beats = { 'rock': 'scissors', 'scissors': 'paper', 'paper': 'rock' }

  return opponent_item if match_status == 'draw'

  return beats[opponent_item.to_sym] if match_status == 'lose'

  beats = beats.invert
  beats[opponent_item].to_s
end

# Main
strategies = File.readlines(path).map do |line|
  opponent, game_status = line.split(' ')

  OpenStruct.new(opponent: opponent, game_status: game_status)
end

strategies.each do |round|
  opponent = match_item(round.opponent.to_sym)
  game_status = match_game_status(round.game_status.to_sym)
  player = player_item(opponent, game_status)

  total_score += calculate_score(player, game_status)
end

p total_score
