# frozen_string_literal: true
require 'pry-byebug'

class Knight
  attr_accessor :graph

  MOVES = [[2, 1], [1, 2], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].freeze

  def initialize
    @move_history = []
  end

  def is_valid?(x_position, y_position)
    if x_position.between?(1, 8) && y_position.between?(1, 8) && !@move_history.include?([x_position, y_position])
      true
    else
      false
    end
  end

  def create_graph(start_loc, end_loc, queue = [])
    node = start_loc.is_a?(Array) ? GraphVertex.new(start_loc) : start_loc
    @move_history << node.value
    return level_order(node) if node.value == end_loc

    MOVES.each do |move|
      if is_valid?(node.value[0] + move[0], node.value[1] + move[1])
        node.add_edge(GraphVertex.new([node.value[0] + move[0], node.value[1] + move[1]], node))
        queue << GraphVertex.new([node.value[0] + move[0], node.value[1] + move[1]], node)
      end
    end
    queue.shift
    create_graph(queue[0], end_loc, queue)
  end

  def knight_moves(start_loc, end_loc)
    move_sequence = create_graph(start_loc, end_loc)

    puts "You made it in #{move_sequence.length - 1} moves!"

    puts 'Here is your path:'
    move_sequence.each { |space| p space }
  end

  def level_order(node, arr_to_return = [])
    return arr_to_return.reverse if node.nil?

    arr_to_return << node.value

    level_order(node.parent, arr_to_return)
  end
end

class GraphVertex
  attr_accessor :value, :neighbors, :parent

  def initialize(value, parent = nil)
    @value = value
    @neighbors = []
    @parent = parent
  end

  def add_edge(neighbor)
    @neighbors << neighbor
  end
end

Knight.new.knight_moves([4, 4], [5, 4])
