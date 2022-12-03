path = 'advent_of_code/2022/3/input.txt'

total = 0

def find_common_char_in_words(first_word, second_word)
  first_word.chars.each do |char|
    return char if second_word.include?(char)
  end
end

File.readlines(path).each do |item_list|
  first_half, second_half = item_list.chars.each_slice(item_list.size / 2).map(&:join)
  common_char = find_common_char_in_words(first_half, second_half)
  total += case common_char
           when 'a'..'z'
             common_char.ord - 96
           else
             common_char.ord - 38
           end
end

p total
