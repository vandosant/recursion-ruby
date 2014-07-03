require 'node'

class Tree
  def print_names(node)
    walk(node) do |child_node|
      puts child_node.name
    end
  end

  def names(node)
    result = []
    walk(node) do |child_node|
      result << child_node.name
    end
    result
  end

  def names_with_indentation(node)
    result = []

    result << node.name

    node.children.each do |child_node|
      result += names_with_indentation(child_node).map { |child_node_name| '  ' + child_node_name }
    end

    result
  end


  def to_hash(node)
    result = {}

    result[node.name] = {}

    node.children.each do |child_node|
      result[node.name].merge!(to_hash(child_node))
    end

    result
  end

  private

  def walk(node, &block)
    block.call(node)
    node.children.each do |child_node|
      walk(child_node, &block)
    end
  end
end