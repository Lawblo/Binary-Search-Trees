# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

# tree = Tree.new([0, 3, 5, 7, 9, 12, 5, 7])
# tree = Tree.new [1, 2, 3, 4, 5]
tree = Tree.new(Array.new(35) { rand(1..100) })

# puts "Is tree balanced? #{tree.balanced?}"

# tree.pretty_print

# nodes_recursive = []
# tree.level_order_recursive { |node| nodes_recursive << node.data}
# puts "Breadth first, recursive: #{nodes_recursive}"

# nodes_iterative = []
# tree.level_order_iterative { |node| nodes_iterative << node.data}
# puts "Breadth first, iterative: #{nodes_iterative}"

# arr_preorder = []
# tree.preorder { |node| arr_preorder << node.data }
# puts "Preorder: #{arr_preorder}"

# arr_postorder = []
# tree.postorder { |node| arr_postorder << node.data }
# puts "Postorder: #{arr_postorder}"

# arr_inorder = []
# tree.inorder { |node| arr_inorder << node.data }
# puts "Inorder: #{arr_inorder}"

puts 'Inserting 20 random numbers from 0 to 100'
20.times { tree.insert(rand(1..100)) }

tree.pretty_print
puts "Is tree balanced? #{tree.balanced?}"

# puts 'Rebalancing tree'
# tree.rebalance

# tree.pretty_print

# puts "Is tree balanced? #{tree.balanced?}"

# nodes_recursive = []
# tree.level_order_recursive { |node| nodes_recursive << node.data}
# puts "Breadth first, recursive: #{nodes_recursive}"

# nodes_iterative = []
# tree.level_order_iterative { |node| nodes_iterative << node.data}
# puts "Breadth first, iterative: #{nodes_iterative}"

# arr_preorder = []
# tree.preorder { |node| arr_preorder << node.data }
# puts "Preorder: #{arr_preorder}"

# arr_postorder = []
# tree.postorder { |node| arr_postorder << node.data }
# puts "Postorder: #{arr_postorder}"

# arr_inorder = []
# tree.inorder { |node| arr_inorder << node.data }
# puts "Inorder: #{arr_inorder}"
