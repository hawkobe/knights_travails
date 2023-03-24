require_relative 'board.rb'

class Knight
  attr_accessor :graph
  MOVES = [[2, 1], [1, 2], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

  def initialize(location, end_loc)
    @location = location
    @move_history = []
    @graph = create_graph(@location, end_loc)
  end

  # set up what moves the knight can make

  # create a graph of moves that are connected to
  # the space that the knight is in

  # need to figure out which graph I will use
  # Graph options:
  # Adjacent Matrix
  # Adjacent List
  # Edge List

  # directed acyclic graph

  # need a history of where the knight
  # has been so it doesn't get caught in a loop
  
  def is_valid?(x_position, y_position)
    if x_position.between?(1, 8) && y_position.between?(1, 8) && !@move_history.include?([x_position, y_position])
      true
    else
      false
    end
  end

  def create_graph(start_loc, end_loc, queue = [@graph])
    node = GraphVertex.new(start_loc)
    @move_history << start_loc
    return if node.value == end_loc

    # queue.shift
    
    MOVES.each do |move|
      if is_valid?(start_loc[0] + move[0], start_loc[1] + move[1])
        node.add_edge(create_graph([start_loc[0] + move[0], start_loc[1] + move[1]], end_loc))
        # queue << [start_loc[0] + move[0], start_loc[1] + move[1]]
      end
    end

    # p queue
    # p node

    # create_graph(queue[0], end_loc, queue)

    # return if queue.empty?
    # node = GraphVertex.new(start_loc)
    # @move_history << start_loc

    # queue.shift
    
    # MOVES.each do |move|
    #   if is_valid?(start_loc[0] + move[0], start_loc[1] + move[1])
    #     node.add_edge(GraphVertex.new([start_loc[0] + move[0], start_loc[1] + move[1]]))
    #     queue << [start_loc[0] + move[0], start_loc[1] + move[1]]
    #   end
    # end
    # create_graph(queue[0], queue)

    node
  end

  def knight_moves(start_loc, end_loc)
    # will call build tree function first
  end

  def level_order(node = @graph, queue = [@graph], arr_to_return = [])
    return arr_to_return if queue.empty?
    
  end

    
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_node(value)
    @nodes << GraphVertex.new(value)
  end

end

class GraphVertex
  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def add_edge(neighbor)
    @neighbors << neighbor
  end
end

knight = Knight.new([1, 1], [2, 3])

p knight.graph.neighbors





