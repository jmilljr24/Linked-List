class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  class << self
    attr_reader :value
  end
end

class LinkedList
  attr_accessor :node, :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def new_node(value, next_node)
    @node = Node.new(value, next_node)
  end

  def prepend_data(value)
    if @head.nil?

      new_node(value, nil)
      @head = value
      @tail = value
    else
      new_node(value, head)
      @head = value
    end
  end
end

one = LinkedList.new

one.prepend_data('justin')
one.prepend_data('tamara')
one.prepend_data('arlo')
one.prepend_data('lou')

number_nodes = ObjectSpace.each_object(Node).count
puts number_nodes
ObjectSpace.each_object(Node) { |i| p i }
