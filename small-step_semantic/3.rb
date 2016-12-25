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
Number.new(1).reducible?
Add.new(Number.new(1), Number.new(2)).reducible?
