require_relative '../file_reader'

lines       = FileReader::lines("input")
frequencies = []

for i in 0...(lines[0].size - 1)
  frequencies.push({})
end

lines.each do |line|
  line.strip.each_char.with_index(0) do |char, i|
    dict = frequencies[i]

    if !dict.has_key?(char)
      dict[char] = 0
    end

    dict[char] += 1
  end
end

puts frequencies.map{ |m| m.max_by(&:last) }.map{ |m| m[0] }.join
