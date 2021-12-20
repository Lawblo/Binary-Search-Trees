# frozen_string_literal: true

require_relative 'array_mod'

# building and managing tree of nodes
class Tree
  include ArrayMod
  attr_accessor(:array, :root)

  def initialize(arr = [])
    p @array = clean_arr(arr)
    @root = build_tree(arr)
  end

  # build binary tree recursively
  def build_tree(arr = array)
    center = mid(arr)
    arr_left = left(arr)
    arr_right = right(arr)
    return Node.new(center) if arr_left.empty? && arr_right.empty?

    left = build_tree(arr_left) unless arr_left.empty?
    right = build_tree(arr_right) unless arr_right.empty?
    Node.new(center, left, right)
  end

  # accepts a value to insert
  def insert(value = 0, node = root)
    return puts "#{value} already exists" if node.data == value
    return node.right = Node.new(value) if node.data < value && node.right.nil?
    return node.left  = Node.new(value) if node.data > value && node.left.nil?

    insert(value, node.right) if value > node.data
    insert(value, node.left) if value < node.data
  end

  # accepts a value to delete
  def delete(value, node = root)
    if value > node.data
      if node.right.data == value
        return node.right = nil if node.right.left.empty? && node.right.right.empty?
        return node.right = node.right.left if node.right.right.empty?
        return node.right = node.right.right if node.right.left.empty?
      end
    end
  end

  # accepts a value and returns the node with the given value
  def find(value); end

  # accepts a block. This method should traverse the
  # tree in breadth-first level order and yield each node
  # to the provided block.
  def level_order_recursive; end

  # accepts a block. This method should traverse the
  # tree in breadth-first level order and yield each node
  # to the provided block.
  def level_order_iterative; end

  # Accepts a block. Traverse the tree inorder.
  # Yield each node to the provided block.
  # The methods should return an array of values if no block is given.
  def inorder; end

  # Accepts a block. Traverse the tree preorder.
  # Yield each node to the provided block.
  # The methods should return an array of values if no block is given.
  def preorder; end

  # Accepts a block. Traverse the tree postorder.
  # Yield each node to the provided block.
  # The methods should return an array of values if no block is given.
  def postorder; end

  # Accepts a node and returns its height.
  # Height is defined as the number of edges in longest path from a given node to a leaf node.
  def height(node); end

  # Accepts a node and returns its depth.
  # Depth is defined as the number of edges in path from a given node to the tree’s root node.
  def depth(node); end

  # checks if the tree is balanced.
  # A balanced tree is one where the difference between heights of
  # left subtree and right subtree of every node is not more than 1.
  def balanced?; end

  # Rebalances an unbalanced tree
  def rebalance; end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
