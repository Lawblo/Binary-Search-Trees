# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

p tree

tree.build_tree