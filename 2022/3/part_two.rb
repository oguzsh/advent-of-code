path = 'advent_of_code/2022/3/input.txt'

total = 0

def find_common_char_in_words(first_word, second_word, third_word)
  first_word.chars.each do |char|
    return char if second_word.include?(char) && third_word.include?(char)
  end
end

File.readlines(path).each_slice(3) do |group|
  group = group.map(&:strip)
  common_char = find_common_char_in_words(group[0], group[1], group[2])
  total += case common_char
           when 'a'..'z'
             common_char.ord - 96
           else
             common_char.ord - 38
           end
end

p total
