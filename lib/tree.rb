# frozen_string_literal: true

require_relative 'array_mod'

# building and managing tree of nodes
# rubocop:disable ClassLength
class Tree
  include ArrayMod
  attr_accessor(:array, :root)

  def initialize(arr = [])
    @array = clean_arr(arr)
    @root = build_tree(array)
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
    if value > node.data
      return node.right = Node.new(value) unless node.right

      insert(value, node.right)
    elsif value < node.data
      return node.left = Node.new(value) unless node.left

      insert(value, node.left)
    else
      puts "#{value} already exists"
    end
  end

  # accepts a value to delete
  def delete(value, node = root, parent = nil)
    if node.data == value
      # Node = nil if match and no children
      if node.right.nil? && node.left.nil?
        node.data > parent.data ? parent.right = nil : parent.left = nil
        return node.delete
      end
      return node.replace(node.right) unless node.left
      return node.replace(node.left) unless node.right
      
      # BOTH CHILDREN EXIST AT THIS POINT
      # find a home for node.right
      temp = node.right
      node.replace(node.left)
      node = node.right until node.right.nil?
      return node.right = temp
    end
    return puts 'node not found' if value > node.data && node.right.nil? || value < node.data && node.left.nil?

    value > node.data ? delete(value, node.right, node) : delete(value, node.left, node)
  end

  # accepts a value and returns the node with the given value
  def find(value, node = root)
    return node if node.data == value
    return puts 'value not in tree' if value > node.data && node.right.nil? || value < node.data && node.left.nil?

    value > node.data ? find(value, node.right) : find(value, node.left)
  end

  # accepts a block. This method should traverse the
  # tree in breadth-first level order and yield each node
  # to the provided block.
  def level_order_recursive(queue = [root], &block)
    node = queue.shift
    yield node
    queue << node.left if node.left
    queue << node.right if node.right
    level_order_recursive(queue, &block) unless queue.empty?
  end

  # accepts a block. This method should traverse the
  # tree in breadth-first level order and yield each node
  # to the provided block.
  def level_order_iterative(queue = [root])
    until queue.empty?
      node = queue.shift
      yield node
      queue << node.left if node.left
      queue << node.right if node.right
    end
  end

  # Accepts a block. Traverse the tree inorder.
  # Yield each node to the provided block.
  # The methods should return an array of values if no block is given.
  def inorder(node = root, &block)
    inorder(node.left, &block) if node.left
    yield node
    inorder(node.right, &block) if node.right
  end

  # Accepts a block. Traverse the tree preorder.
  # Yield each node to the provided block.
  # The methods should return an array of values if no block is given.
  def preorder(node = root, &block)
    yield node
    preorder(node.left, &block) if node.left
    preorder(node.right, &block) if node.right
  end

  # Accepts a block. Traverse the tree postorder.
  # Yield each node to the provided block.
  # The methods should return an array of values if no block is given.
  def postorder(node = root, &block)
    postorder(node.left, &block) if node.left
    postorder(node.right, &block) if node.right
    yield node
  end

  # Accepts a node and returns its height.
  # Height is defined as the number of edges in longest path from a given node to a leaf node.
  def height(node = root, counter = 0, max = 0)
    if node.left || node.right
      counter += 1
      max = height(node.left, counter, max) if node.left
      max = height(node.right, counter, max) if node.right
    end
    max = counter if max < counter
    max
  end

  # Accepts a node and returns its depth.
  # Depth is defined as the number of edges in path from a given node to the tree’s root node.
  def depth(find_node, node = root, counter = 0)
    return unless find_node
    return counter if find_node.data == node.data

    counter += 1
    depth(find_node, node.left, counter) if find_node.data < node.data
    depth(find_node, node.right, counter) if find_node.data > node.data
  end

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

# rubocop:enable ClassLength
