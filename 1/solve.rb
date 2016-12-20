@x = 0
@y = 0
@d = 0   # 0: North, 1: East, 2: South, 3: West

def rotate_right
  @d = (@d + 1) % 4
end

def rotate_left
  @d = (@d - 1) % 4
end

def walk(n)
  if @d == 0
    @y += n
  elsif @d == 1
    @x += n
  elsif @d == 2
    @y -= n
  else
    @x -= n
  end
end


File.open("input", "r") do |f|
  f.each_line do |line|
    instructions = line.gsub("\n", '').split(",")

    instructions.each do |instruction|
      instruction = instruction.gsub(" ",'')
      if instruction[0] == "R"
        rotate_right
      else
        rotate_left
      end
      instruction[0] = ''
      walk(instruction.to_i)
    end
  end
  puts "You started at: 0, 0"
  puts "You finished at: #{@x}, #{@y}"
  puts "Distance is: #{(0 - @x).abs + (0 - @y).abs}"
end

