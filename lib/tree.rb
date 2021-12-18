# frozen_string_literal: true

# building and managing tree of nodes
class Tree
  attr_accessor(:array)

  def initialize(array = [])
    @array = array.sort
  end

  def build_tree
    p array
  end
end
