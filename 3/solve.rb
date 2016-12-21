require_relative '../file_reader'

lines     = FileReader::lines("input")
possible  = 0

def possible(sides)
  for i in 0..2
    if (sides[i] + sides[(i + 1) % 3]) <= sides[(i + 2) % 3]
      return false
    end
  end
  true
end

lines.each do |line|
  sides = line.split(" ").map { |e| e.to_i }

  if possible(sides)
    possible += 1
  end
end

puts "#{lines.size} triangles read. Only #{possible} are possible."
