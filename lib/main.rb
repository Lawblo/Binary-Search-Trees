# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

# tree = Tree.new([0, 3, 5, 7, 9, 12, 5, 7])
# tree = Tree.new [1, 2, 3, 4, 5]
tree = Tree.new(Array.new(35) { rand(1..100) })

tree.pretty_print


# tree.insert 3
tree.insert(31)
tree.delete(12)
# tree.delete(3)
p tree.find(7)

tree.pretty_print

# nodes_recursive = []
# tree.level_order_recursive { |node| nodes_recursive << node.data}

#  p nodes_recursive

# nodes_iterative = []
# tree.level_order_iterative { |node| nodes_iterative << node.data}

#  p nodes_iterative

# nodes_inorder = []
# tree.inorder { |node| nodes_inorder << node.data }
# p nodes_inorder

# nodes_preorder = []
# tree.preorder { |node| nodes_preorder << node.data }
# p nodes_preorder

# nodes_postorder = []
# tree.postorder { |node| nodes_postorder << node.data }
# p nodes_postorder

puts tree.height

puts tree.depth(tree.find(83))
