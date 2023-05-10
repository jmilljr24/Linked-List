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
      @tail = @head
      @head = new_node
    end
  end
end

one = LinkedList.new

one.prepend_data('justin')
one.prepend_data('tamara')
one.prepend_data('arlo')

ObjectSpace.each_object(Node) { |i| p i }
