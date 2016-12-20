require_relative '../file_reader'

@code         = []
@position     = 5
@instructions = FileReader::lines("input")

def move(instruction)
  if instruction == "U"
    move_up
  elsif instruction == "D"
    move_down
  elsif instruction == "L"
    move_left
  elsif instruction == "R"
    move_right
  end
end

def move_up
  if @position != 1 && @position != 2 && @position != 3
    @position = @position - 3
  end
end

def move_down
  if @position != 7 && @position != 8 && @position != 9
    @position = @position + 3
  end
end

def move_left
  if @position != 1 && @position != 4 && @position != 7
    @position = @position - 1
  end
end

def move_right
  if @position != 3 && @position != 6 && @position != 9
    @position = @position + 1
  end
end

@instructions.each do |instruction|
  instruction.each_char do |char|
    move(char)
  end
  @code << @position
end

puts @code

