require 'node'

describe Node do

  it "has a name" do
    expect(Node.new("Foo").name).to eq("Foo")
  end

  it "can add child nodes" do
    node = Node.new("Foo")
    child_node = Node.new("Bar")
    node.add_child(child_node)
    expect(node.children).to eq([child_node])
    expect(child_node.name).to eq("Bar")
  end

end