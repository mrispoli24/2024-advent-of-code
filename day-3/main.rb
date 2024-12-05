input = File.read('./day-3/input.txt')

total = 0

new_input = input.gsub(/don't\(\)(.*?)do\(\)/m, '')

new_input.scan(/mul\((\d+),(\d+)\)/) do |num1, num2|
  product = num1.to_i * num2.to_i
  total += product
end

puts total
