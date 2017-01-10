require_relative '../file_reader'

lines = FileReader::lines("input")

def max_char(chars)
  if chars.length == 0
    return []
  end

  max       = chars.max_by { |k,v| v }[1]
  max_chars = chars.select { |k,v| v == max }
    .map { |k,v| k }
  new_chars = chars.select { |k,v| !max_chars.include?(k) }
  result    = max_chars.sort_by { |m| m } + max_char(new_chars)
end

def chars_count(line)
  chars = {}

  line.each_char do |char|
    if char =~ /[[:digit:]]/
      break
    end

    if char != '-'
      if chars[char] == nil
        chars[char] = 0
      end
      chars[char] += 1
    end
  end

  return chars
end


id_sum = 0

lines.each do |line|
  top_chars = max_char(chars_count(line)).first(5).join("")
  checksum  = line.scan(/\[.{1,5}\]/).first[1..-2]

  if checksum == top_chars
    id      = line.scan(/\d+/).first.to_i
    id_sum += id
  end
end

puts id_sum
