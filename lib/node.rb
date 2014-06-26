class Node
  attr_reader :name
  attr_reader :children

  def initialize(name)
    @name = name
    @children = []
  end

  def add_child(name)
    node = Node.new(name)
    @children << node
    node
  end
end
