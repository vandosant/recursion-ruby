require 'node'

class Tree
  def print_names(node)
    puts node.name

    node.children.each do |child_node|
      print_names(child_node)
    end
  end

  def names(node)
    result = []

    result << node.name

    node.children.each do |child_node|
      result += names(child_node)
    end

    result
  end

  def names_with_indentation(node)
    result = []

    result << node.name

    node.children.each do |child_node|
      result += names_with_indentation(child_node).map { |item| '  ' + item.to_s }
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
end