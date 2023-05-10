class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :node, :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend_data(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head.value
      @head = new_node
    end
  end

  def append_data(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node.value
      @tail = new_node
    end
  end
end

one = LinkedList.new

one.prepend_data(3)
one.prepend_data(4)
one.prepend_data(5)
one.append_data(2)
one.append_data(1)

ObjectSpace.each_object(Node) { |i| p i }
