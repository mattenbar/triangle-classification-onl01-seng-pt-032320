class Triangle
  # write code here
  attr_accessor :base, :height, :hypotenuse, :equilateral, :isosceles, :scalene

  def initialize (base, height, hypotenuse)
    @base = base
    @height = height
    @hypotenuse = hypotenuse
  end

  def no_sides_or_negative_sides?
    if @base <= 0 || @height <= 0 || @hypotenuse <= 0
      return true
    else
      return false
    end
  end


  def triangle_iniquality?
    if (@base >= @hypotenuse + @height) || (@hypotenuse >= @base + @height) || (@height >= @base + @hypotenuse)
      return true
    else
      return false
    end
  end

  def valid?
    if no_sides_or_negative_sides? || triangle_iniquality?
      return true
    else
      return false
    end
  end

  def kind
    if valid?
     begin
       raise TriangleError
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
    # def message
      # "this is not a triangle"
    # end
  end
end
