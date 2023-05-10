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
      new_node.next_node = @head
      @head = new_node
    end
  end

  def append_data(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def size
    size = ObjectSpace.each_object(Node).count
    puts "The list contains #{size} nodes"
  end

  def head
    puts @head.value
  end

  def tail
    puts @tail.value
  end

  def at(index)
    i = 0
    if index == 0
      puts @head.value
      return
    end
    current = @head
    until i == index
      current = current.next_node
      i += 1
    end
    return if current.nil?

    puts current.value
  end
end

one = LinkedList.new

one.prepend_data(3)
one.prepend_data(2)
one.prepend_data(1)
one.append_data(4)
one.append_data(5)

# ObjectSpace.each_object(Node) { |i| p i }

one.at(5)
