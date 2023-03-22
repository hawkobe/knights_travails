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

  def create_graph(start)
    root = GraphVertex.new(start)

    MOVES.each do |move|
      if (1..8).include?(start[0] + move[0]) && (1..8).include?(start[1] + move[1])
        root.add_edge([(start[0] + move[0]), (start[1] + move[1])])
      end
    end

    # need to add a queue of some sort

    @graph.add_node(root)

    p @graph.nodes

    # root.neighbors.each do |neighbor|
    #   create_graph(neighbor)
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




