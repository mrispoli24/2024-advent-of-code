total_instances = 0

word_matrix = File.readlines('./day-4/input.txt').map(&:strip).map(&:chars)

DIRECTIONS = [
  [0, 1],   # right
  [1, 0],   # down
  [0, -1],  # left
  [-1, 0],  # up
  [1, 1],   # diagonal down-right
  [-1, -1], # diagonal up-left
  [1, -1],  # diagonal down-left
  [-1, 1]   # diagonal up-right
]

# Part 1 - Depth first search find all instances of 'XMAS'
word_matrix.each_with_index do |row, row_index|
  row.each_with_index do |char, col_index|
    DIRECTIONS.each do |direction|
      dx, dy = direction
      x = row_index
      y = col_index
      word = ''

      while x >= 0 && x < word_matrix.length && y >= 0 && y < row.length && word.length <= 4
        word += word_matrix[x][y]
        x += dx
        y += dy
        total_instances += 1 if word == 'XMAS'
      end
    end
  end
end

puts total_instances

# Part 2 - Find all instances of 'MAS' in an X pattern

total_instances = 0

DIAGONAL_DIRECTIONS = [
  [-1, -1], # diagonal up-left
  [-1, 1],   # diagonal up-right
  [1, -1],  # diagonal down-left
  [1, 1],   # diagonal down-right
]

POSSIBLE_MATCHES = [
  "SSMM",
  "MMSS",
  "MSMS",
  "SMSM"
]

word_matrix.each_with_index do |row, row_index|
  row.each_with_index do |char, col_index|
    match = ''
    if char == "A"

      DIAGONAL_DIRECTIONS.each do |direction|
        dx, dy = direction
        x = row_index + dx
        y = col_index + dy

        if x >= 0 && x < word_matrix.length && y >= 0 && y < row.length
          match += word_matrix[x][y]
        end
      end

      total_instances += 1 if POSSIBLE_MATCHES.include?(match)
    end
  end
end

puts total_instances
