path = 'advent_of_code/2022/1/input.txt'

calories = File.readlines(path, chomp: true).slice_before(&:empty?).map { |calorie_group| calorie_group.sum(&:to_i) }

p calories.max
