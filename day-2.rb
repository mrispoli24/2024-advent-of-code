def is_valid_sequence?(levels)
  return true if levels.length <= 2

  # Check if sequence is increasing
  increasing = true
  decreasing = true

  for i in 0..levels.length-2
    diff = levels[i+1] - levels[i]

    # Check if difference is within bounds (1-3)
    return false if diff.abs > 3 || diff == 0

    # is direction consistent?
    increasing = false if diff < 0
    decreasing = false if diff > 0
  end

  increasing || decreasing
end

def levels_status(levels)
  return "safe" if is_valid_sequence?(levels)

  # If not valid, try removing each number once
  levels.length.times do |i|
    test_levels = levels.dup
    test_levels.delete_at(i)

    return "safe" if is_valid_sequence?(test_levels)
  end

  "unsafe"
end

reports_status = []

ARGF.each_line do |line|
  levels = line.strip.split(/\s+/).map(&:to_i)
  reports_status << levels_status(levels)
end

total_safe_reports = reports_status.count { |status| status == "safe" }
puts total_safe_reports
