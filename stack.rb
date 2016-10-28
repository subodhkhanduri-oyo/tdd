class Stack

  attr_reader :size, :capacity

  class InvalidCapacity < StandardError; end
  class Overflow < StandardError; end
  class Underflow < StandardError; end

  def initialize(capacity)
    raise InvalidCapacity unless capacity.is_a?(Integer) && capacity >= 0

    self.capacity = capacity
    self.size = 0
    self.elements = []
  end

  def push(element)
    raise Overflow if size >= capacity

    elements.push(element)
    self.size += 1
  end

  def pop
    raise Underflow if size <= 0

    elements.pop
    self.size -= 1
  end

  def top
    elements.last
  end

  private

  attr_accessor :elements
  attr_writer :size, :capacity
end
