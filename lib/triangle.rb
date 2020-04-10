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

  def equilateral?
    @base == @height && @height == @hypotenuse
      return true
  end

  def isosceles?
    if (@base == @height && @height != @hypotenuse) || (@base == @hypotenuse && @hypotenuse != @height) || (@height == @hypotenuse && @height != @base)
      return true
    end
  end

  def scalene?
    if @base != @height && @height != @hypotenuse && @base != @hypotenuse
      return true
    end
  end


  def kind
    if valid?
     begin
       raise TriangleError
      end
    elsif isosceles?
      return :isosceles
    elsif scalene?
      return :scalene
    elsif equilateral?
      return :equilateral
    end
  end

  class TriangleError < StandardError
  end
end
