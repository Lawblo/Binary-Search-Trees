# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

tree = Tree.new([0, 3, 5, 7, 9, 12, 5, 7])

# tree = Tree.new(Array.new(15) { rand(1..100) })

tree.insert(31)

tree.pretty_print

tree.delete(12)

tree.pretty_print

p tree.find(7)
