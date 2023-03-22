require_relative 'board.rb'

class Knight
  MOVES = [[2, 1], [1, 2], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

  def initialize(location = nil)
    @location = location
    @move_history = []
    @graph = Graph.new
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

  def create_graph(start_loc, end_loc)
    node = GraphVertex.new(start_loc)

    return if node.value == end_loc
    
    MOVES.each do |move|
      if is_valid?(start_loc[0] + move[0], start_loc[1] + move[1])
        node.add_edge([start_loc[0] + move[0], start_loc[1] + move[1]])
        @graph.add_node([start_loc[0] + move[0], start_loc[1] + move[1]])
        create_graph([start_loc[0] + move[0], start_loc[1] + move[1]], end_loc)
      end

      # if (1..8).include?(start_loc[0] + move[0]) && (1..8).include?(start_loc[1] + move[1])
      #   node.add_edge([(start_loc[0] + move[0]), (start_loc[1] + move[1])])
      # end
    end


    # need to add a queue of some sort

    # @graph.add_node(root)

    p @graph.nodes

    # node.neighbors.each do |neighbor|
    #   return if neighbor == end_loc
    #   create_graph(neighbor, end_loc)
    # end
  end

  def knight_moves(start_loc, end_loc)
    # will call build tree function first
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

Knight.new.create_graph([1,1])




