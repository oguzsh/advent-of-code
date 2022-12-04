path = 'advent_of_code/2022/4/input.txt'

part_one_count = 0
part_two_count = 0

def numbers_between_in_range(assigment)
  Range.new(*parse_number(assigment).map(&:to_i))
end

def parse_number(assigment)
  assigment.split('-')
end

def contain_range?(first, second)
  first.cover?(second) || second.cover?(first)
end

def overlap_range?(first, second)
  first.cover?(second.first) || first.cover?(second.last) || second.cover?(first.first) || second.cover?(first.last)
end

File.readlines(path).each do |section|
  assignments = section.split(',')

  first_number_list = numbers_between_in_range(assignments.first)

  second_number_list = numbers_between_in_range(assignments.last)

  part_one_count += 1 if contain_range?(first_number_list, second_number_list)
  part_two_count += 1 if overlap_range?(first_number_list, second_number_list)
end

puts part_one_count
puts part_two_count
