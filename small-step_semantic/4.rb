#!/usr/bin/irb
# Define basic class
class Number < Struct.new(:value)
  def to_s
    value.to_s
  end

  def reducible?
    false
  end

  def inspect
    "«#{self}»"
  end
end

class Add < Struct.new(:left, :right)
  def reduce
    if left.reducible?
      Add.new(left.reduce, right)
    elsif right.reducible?
      Add.new(left, right.reduce)
    else
      Number.new(left.reduce + right.reduce)
    end
  end

  def to_s
    "#{left} + #{right}"
  end

  def reducible?
    true
  end

  def inspect
    "«#{self}»"
  end
end

class Multiply < Struct.new(:left, :right)
  def reduce
    if left.reducible?
      Add.new(left.reduce, right)
    elsif right.reducible?
      Add.new(left, right.reduce)
    else
      Number.new(left.reduce * right.reduce)
    end
  end
  def to_s
    "#{left} * #{right}"
  end

  def reducible?
    true
  end

  def inspect
    "«#{self}»"
  end
end

# Operation
expression =
    Add.new(
           Multiply.new(Number.new(3), Number.new(4)),
           Multiply.new(Number.new(3), Number.new(2))
    )
expression.reduce
