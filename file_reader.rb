class FileReader
  def self.lines(file)
    lines = []

    File.open(file, "r") do |file|
      file.each_line do |line|
        lines << line
      end
    end

    lines
  end
end
