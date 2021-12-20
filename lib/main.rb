# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

big = Tree.new([0, 2, 5, 7, 9, 10, 11, 12])

p big
big.pretty_print

big.insert(2)

big.insert(1)

big.insert(14)

big.pretty_print
