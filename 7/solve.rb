require_relative '../file_reader'

lines = FileReader::lines("input")
count = 0

def is_abba?(str)
  return ((str == str.reverse) && (str.chars.uniq.length > 1) && (str.length == 4))
end

def has_abba?(str)
  (0...(str.length - 3)).each do |i|
    if is_abba?(str[i...(i + 4)])
      return true
    end
  end
  return false
end

lines.each do |line|
  hypernets = line.scan(/\[[a-z]*\]/)
  for hypernet in hypernets
    if has_abba?(hypernet)
      stop = true
    else
      line.gsub(hypernet, " ")
    end
  end

  if !stop
    for sequence in line.split()
      if has_abba?(sequence)
        count += 1
        break
      end
    end
  end
end

puts count
