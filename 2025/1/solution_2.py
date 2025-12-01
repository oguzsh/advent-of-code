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
        
        step = 1 if direction == RIGHT else -1
    
        for _ in range(distance):
            current_pos += step
            if current_pos == 100:
                current_pos = 0
            if current_pos == -1:
                current_pos = 99
            
            if current_pos == 0:
                counter += 1



print(counter)
