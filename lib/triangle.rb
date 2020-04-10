class Triangle
  # write code here
  attr_accessor :base, :height, :hypotenuse, :equilateral, :isosceles, :scalene

  def initialize (base, height, hypotenuse)
    @base = base
    @height = height
    @hypotenuse = hypotenuse
  end

  def kind
    if @base <= 0 || @height <= 0 || @hypotenuse <= 0
      begin
        raise TriangleError
      rescue TriangleError => error
        puts error.message
      end
    elsif @base == @height && @height == @hypotenuse
      return :equilateral

    elsif (@base == @height && @height != @hypotenuse) || (@base == @hypotenuse && @hypotenuse != @height) || (@height == @hypotenuse && @height != @base)
      return :isosceles

    else @base != @height && @height != @hypotenuse && @base != @hypotenuse
      return :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "this is not a triangle"
    end
  end
end
