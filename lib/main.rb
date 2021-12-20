# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

tree = Tree.new([1, 2, 4, 5, 6, 7, 8, 9])
puts 'BEFORE'

tree.insert(0)

tree.insert(2)

tree.pretty_print