require 'node'

describe Node do

  it "has a name" do
    expect(Node.new("Foo").name).to eq("Foo")
  end

  it "can add child nodes" do
    node = Node.new("Foo")
    child_node = node.add_child("Bar")
    expect(node.children).to eq([child_node])
    expect(child_node.name).to eq("Bar")
  end

end