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
end
