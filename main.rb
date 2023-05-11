class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail

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
    #  size = ObjectSpace.each_object(Node).count
    size = 0
    ObjectSpace.each_object(Node) do |ob|
      size += 1 unless ob.value.nil?
    end
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
      return if current.nil?

      current = current.next_node
      i += 1
    end
    return if current.nil?

    puts current.value
  end

  def tail
    puts @tail.value
  end

  def pop
    i = 0
    second_last_node = nil
    current = @head
    until current.next_node.nil?
      second_last_node = current
      current = current.next_node
    end
    @tail.value = nil
    @tail = second_last_node
    second_last_node.next_node = nil
  end

  def contains?(value)
    current = @head
    loop do
      return puts true if current.value == value

      current = current.next_node
      return puts false if current.next_node.nil?
    end
  end

  def find(value)
    current = @head
    i = 0
    loop do
      return puts i if current.value == value

      current = current.next_node
      i += 1
      break if current.next_node.nil?
    end

    p nil
  end

  def to_s
    current = @head
    puts current.value.to_s
    until current.next_node.nil?
      current = current.next_node
      puts current.value.to_s
    end
  end
end

list = LinkedList.new

# test class methods
list.prepend_data(3)
list.prepend_data(2)
list.prepend_data(1)
list.append_data(4)
list.append_data(5)

list.size

list.head

list.tail

list.at(3) # returns index
list.at(10) # returns empty if outside of list range

list.pop

list.contains?(2) # returns true
list.contains?(10) # returns false

list.find(3) # returns index of node containing value
list.find(10) # returns nil if not found

list.to_s # returns all list items from head to tail
