# frozen_string_literal: true

# building and managing tree of nodes
class Tree
  attr_accessor(:array, :root)

  def initialize(array = [])
    @array = array.sort
    @root = build_tree(array)
  end

  # build binary tree recursively
  def build_tree(array = @array)
    return array if array.length <= 1

    root = mid(array)
    array_left = left(array)
    array_right = right(array)
    Node.new(root, build_tree(array_left), build_tree(array_right))
  end

  def mid(array)
    array[(0 + array.length - 1) / 2]
  end

  def left(array)
    array[0, (0 + array.length - 1) / 2]
  end

  def right(array)
    array[(0 + array.length - 1) / 2 + 1, array.length - 1]
  end
end
