require_relative '../../lib/node'

def capture
  begin
    old_stdout = $stdout
    $stdout = StringIO.new('', 'w')
    yield
    $stdout.string
  ensure
    $stdout = old_stdout
  end
end

class TreeBuilder
  def initialize(node = nil)
    @node = node
  end

  def add_child(string, &block)
    child_node = Node.new(string)
    @node.add_child(child_node)
    builder = TreeBuilder.new(child_node)
    builder.instance_eval(&block) if block
    @node
  end
end

def build_tree(name, &block)
  node = Node.new(name)
  builder = TreeBuilder.new(node)
  builder.instance_eval(&block)
end
