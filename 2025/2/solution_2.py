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
        n = len(num_str)

        if(n < 2):
          continue

        for pattern_len in range(1, n // 2 + 1):
          if n % pattern_len != 0:
            continue

          pattern = num_str[:pattern_len]
          repeat_count = n // pattern_len
          result = pattern * repeat_count

          if result == num_str:
            invalid_ids.append(num)
            break

print(sum(invalid_ids))
