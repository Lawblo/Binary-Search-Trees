# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

tree = Tree.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

tree

tree.build_tree

p tree.root.data

