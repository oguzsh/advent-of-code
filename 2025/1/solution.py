current_pos = 50
counter = 0

LEFT = "L"
RIGHT = "R"

with open('input.txt') as file:
    for line in file:
        line = line.strip()

        if not line:
            continue

        direction = line[0]
        distance = int(line[1:])

        if direction == LEFT:
            current_pos = (current_pos - distance) % 100
        else:
            current_pos = (current_pos + distance) % 100

        
        if current_pos == 0:
            counter += 1



print(counter)
