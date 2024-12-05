list1 = []
list2 = []
distances = []

ARGF.each_line do |line|

  num1, num2 = line.strip.split(/\s+/).map(&:to_i)

  list1 << num1
  list2 << num2
end


sorted_list1 = list1.sort
sorted_list2 = list2.sort

for i in 0..list1.length-1
  diff = sorted_list1[i] - sorted_list2[i]
  distances << diff.abs
end

total_of_distances = distances.reduce(0) { |sum, x| sum + x }

puts total_of_distances

similarity_scores = []

for i in 0..list1.length-1
  current_num1 = list1[i]
  total_occurances_in_list2 = 0
  for j in 0..list2.length-1
    if current_num1 == list2[j]
      total_occurances_in_list2 += 1
    end
  end

  similarity_scores << current_num1 * total_occurances_in_list2
end

total_similarity_score = similarity_scores.reduce(0) { |sum, x| sum + x }

puts total_similarity_score
