# knights_trevails

The goal here is to create a program that
moves a chess knight from one location to another
in the fewest number of moves possible.

This project was very hard for me because I got
very hung up on which type of graph I was supposed
to be using for the moves the knight could make from
each position.

Originally, I had created a board but then determined
I didn't need a board in order to complete the project.

I assume when I actually make the GAME chess, I will
need to have a board, so I have considered what options
I will need to implement there.

I'm still having a hard time knowing how best to create
the GRAPH that I would need to create a data structure
that I could then traverse with BFS or DFS, but for this
project just decided to use a BFS style method from the start,
implementing a queue and stopping creation of the graph as soon 
as I reach the destination that was input. Creating an
actual graph data structure may be something I will need 
to consider moving forward, when implementing the actual
game of chess, but what I have here works for what 
it needs to accomplish.

Trying to create a data structure using recursion AND
a loop inside that recursive function were definitely the
pain points of the project here for me. Eventually I found
that the queue worked very well to be able to create all
the children of a node BEFORE recursively calling the function again,
as doing the latter only creates one branch that it follows
all the way to a base case, which doesn't get you the shortest path,
in the way I have it set up.

Happy to be done with this project, as it was very hard, but
have learned when I need to call for a queue/BFS method in
the future :)