class MyMatrix
  attr_accessor :seed
  attr_accessor :matrix

  NORTH = -1
  SOUTH = 1
  EAST = -1
  WEST = 1
  STILL = 0

  def self.run
    unless ARGV.count==1
      puts "This application takes a single argument (a seed) only"
    else
      m = MyMatrix.new(ARGV[0].to_i)
      if m.perfect_square? 
        m.print_matrix
      else
        puts "This seed does not product a perfect square"   
      end
    end
  end

  def initialize seed
    @seed = seed
    build_spiral_matrix if perfect_square?
  end

  def root
    Math.sqrt(seed)
  end

  def whole_root
    root.to_i
  end

  def perfect_square?
    root.to_i == Math.sqrt(seed)
  end

  def print_matrix
    format = "%#{seed_digits + 1}d"
    @matrix.each do |row|
      row.each{|value| print (format % value) }
      puts "\n"
    end
  end

  private
  def build_zero_matrix
    @matrix = Array.new(whole_root) {|i| Array.new(whole_root, 0)}
  end

  def seed_digits
    @seed.to_s.length
  end

  def build_spiral_matrix
    build_zero_matrix

    x = (whole_root-1)/2
    y = whole_root/2
    x_increment = y_increment = x_steps = y_steps = 1
    x_direction = 1
    y_direction = 0

    (1..seed).each do |value|
      row = @matrix[y]
      row[x] = value

      x_steps -= 1 unless x_direction.zero?
      y_steps -= 1 unless y_direction.zero?

      x += x_direction
      y += y_direction

      if x_direction > 0 && x_steps.zero?
        x_direction = STILL
        x_increment += 1
        x_steps = x_increment
        y_direction = NORTH
      elsif x_direction < 0 && x_steps.zero?
        x_direction = STILL
        x_increment += 1
        x_steps = x_increment
        y_direction = SOUTH
      elsif y_direction > 0 && y_steps.zero?
        y_direction = STILL
        y_increment += 1
        y_steps = y_increment
        x_direction = WEST
      elsif y_direction < 0 && y_steps.zero?
        y_direction = 0
        y_increment += 1
        y_steps = y_increment
        x_direction = EAST
      end
    end
  end
end

MyMatrix.run