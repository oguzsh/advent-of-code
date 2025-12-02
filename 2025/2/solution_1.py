invalid_ids = []


with open('input.txt') as file:
  for line in file:
    line = line.strip()

    if not line:
      continue

    for r in line.split(','):
      start, end = map(int, r.split('-'))

      for num in range(start, end + 1) :
        num_str  = str(num)

        if(len(num_str) % 2 != 0):
          continue

        mid = len(num_str) // 2

        left, right = num_str[:mid], num_str[mid:]

        if left[0] == '0' or right[0] == '0':
          continue

        if left == right:
          invalid_ids.append(num)

print(sum(invalid_ids))
