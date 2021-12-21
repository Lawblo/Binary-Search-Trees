# frozen_string_literal: true

# class managing binary tree nodes
class Node
  # https://ruby-doc.org/core-2.5.0/Comparable.html
  include Comparable
  attr_accessor(:data, :left, :right)

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def children?
    return true if left.nil? && right.nil?

    false
  end

  # deletes the node
  def delete
    self.data = nil
    self.left = nil
    self.right = nil
  end

  # replaces the node with the specified node
  def replace(node)
    self.data = node.data
    self.left = node.left
    self.right = node.right
  end
end
