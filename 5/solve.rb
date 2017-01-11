require 'digest'

def md5_digest(string)
  Digest::MD5.hexdigest(string)
end

door_id = "ffykfhsq"
code    = ""
i       = 0

while code.size != 8
  digest = md5_digest(door_id + i.to_s)
  if digest[0...5] == "00000"
    code += digest[5]
  end
  if i % 1000000 == 0
    puts "Here!"
    puts code.size
  end
  i += 1
end

puts code

