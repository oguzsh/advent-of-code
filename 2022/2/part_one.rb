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
  keys = {
    'A': 'rock',
    'B': 'paper',
    'C': 'scissors',
    'X': 'rock',
    'Y': 'paper',
    'Z': 'scissors'
  }

  keys[key.to_sym] || nil
end

# Main
strategies = File.readlines(path).map do |line|
  opponent, player = line.split(' ')

  OpenStruct.new(opponent: opponent, player: player)
end

strategies.each do |round|
  player = match_item(round.player.to_sym)
  opponent = match_item(round.opponent.to_sym)

  total_score += if win?(player, opponent)
                   calculate_score(player, 'win')
                 elsif draw?(player, opponent)
                   calculate_score(player, 'draw')
                 else
                   calculate_score(player, 'lose')
                 end
end

p total_score
