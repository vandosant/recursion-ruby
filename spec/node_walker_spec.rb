require 'node_walker'

describe NodeWalker do

  it "can print all of the names recursively" do
    trystan = Node.new("Trystan")
    trystan.add_child("Peggie")
    sierra = trystan.add_child("Sierra")
    sierra.add_child("Giuseppe")
    sierra.add_child("Orval")

    node_walker = NodeWalker.new

    result = capture { node_walker.print_names(trystan) }

    expect(result).to eq("Trystan\nPeggie\nSierra\nGiuseppe\nOrval\n")
  end

  it "can return an array of all names recursively" do
    pending

    trystan = Node.new("Trystan")
    trystan.add_child("Peggie")
    sierra = trystan.add_child("Sierra")
    sierra.add_child("Giuseppe")
    sierra.add_child("Orval")

    node_walker = NodeWalker.new

    actual = node_walker.names(trystan)
    expect(actual).to eq(["Trystan", "Peggie", "Sierra", "Giuseppe", "Orval"])
  end

  it "can return an array of all names recursively, with each new level indented by two spaces" do
    pending

    trystan = Node.new("Trystan")
    trystan.add_child("Peggie")
    sierra = trystan.add_child("Sierra")
    sierra.add_child("Giuseppe").add_child("Orval")

    node_walker = NodeWalker.new

    actual = node_walker.names_with_indentation(trystan)
    expect(actual).to eq(["Trystan", "  Peggie", "  Sierra", "    Giuseppe", "      Orval"])
  end

  it "can return an array of names in a nested hash" do
    pending

    trystan = Node.new("Trystan")
    trystan.add_child("Peggie")
    sierra = trystan.add_child("Sierra")
    sierra.add_child("Giuseppe").add_child("Orval")

    node_walker = NodeWalker.new

    actual = node_walker.to_hash(trystan)
    expect(actual).to eq({
      "Trystan" => {
        "Peggie" => {},
        "Sierra" => {
          "Giuseppe" => {
            "Orval" => {}
          }
        }
      }
    })
  end

  private

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

end