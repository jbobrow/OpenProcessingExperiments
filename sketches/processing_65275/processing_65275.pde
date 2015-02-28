
// Graph Workshop
// David Balash 2012  

// Press "v" to toggle the addition of a vertex, use the mouse to add a new vertex.
// Press "e" to toggle the addition of an edge, use the mouse to add a new edge.
// Press "r" to toggle the removal of a vertex, use the mouse to select a vertex to remove.
// Press "s" to toggle the selection of a start vertex, use the mouse to select a vertex. 
// Press "g" to toggle the selection of a goal or end vertex, use the mouse to select a vertex.
// Press "i" to toggle directional graph (Digraph).
// Press "j" to run Dijkstra's Algorithm (Single Source Shortest Path). 
// Press "b" to run Breadth First Search (BFS). 
// Press "d" to run Depth First Search (DFS). 
// Press "f" to run Find Eulerian Path.
// Press "n" to go to the next step of a search algorithm. 
// Press "c" to clear visited vertices and traversed edges. 
// Press "m" to print adjacency matrix and weighted adjacency matrix.
// Press "p" to print graph information.
// Press "l" to toggle vertex labels.  
// Press "k" to toggle edge labels.  

final int STANDARD_WIDTH = 720;
final int STANDARD_HEIGHT = 720;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final color EDGE_COLOR = 0xFF000000;
final float EDGE_STROKE_WEIGHT = 1.5;
final color TRAVERSED_EDGE_COLOR = 0xFFCFB53B;
final float TRAVERSED_EDGE_STROKE_WEIGHT = 3.5;
final int VISITED_VERTEX_STROKE_COLOR = 0xFFCFB53B;
final int VISITED_VERTEX_STROKE_WEIGHT = 8;
final int VERTEX_DIAMETER = 50;

Graph graph = new Graph();
Vertex selectedVertex;
boolean vertexSelected = false;
boolean toggleAddVertex = true;
boolean toggleAddEdge = false;
boolean toggleRemoveVertex = false;
boolean toggleSelectStartVertex = false;
boolean toggleSelectGoalVertex = false;
boolean toggleDigraph = true;
boolean toggleShowVertexLabel = true;
boolean toggleShowEdgeLabel = true;
boolean toggleDFS = false;
boolean toggleBFS = false;
boolean toggleDijkstra = false;


void setup()
{
    size(STANDARD_WIDTH, STANDARD_HEIGHT);
    background(BACKGROUND_COLOR);
    smooth();
}


void draw()
{
	background(BACKGROUND_COLOR);
	
	graph.show(toggleShowVertexLabel, toggleShowEdgeLabel);
	
	if (vertexSelected)
	{
		PVector vertexLocation = selectedVertex.getVertexLocation();
		stroke(0);
		line(mouseX, mouseY, vertexLocation.x, vertexLocation.y);
	}
}


void keyPressed()
{
	if (key == 'm')
	{
		graph.printAdjacencyMatrix();
		graph.printWeightedAdjacencyMatrix();
	}
	if (key == 'p')
	{
		graph.printGraphInformation();
	}
	if (key == 'c')
	{
		graph.clearVisitedVertices();
		graph.clearTraversedEdges();
	}
	else if (key == 'b')
	{
		toggleBFS = true;
		toggleDFS = false;
		toggleDijkstra = false;
		graph.startNextStepBreadthFirstSearch();
	}
	else if (key == 'd')
	{
		toggleDFS = true;
		toggleBFS = false;
		toggleDijkstra = false;
		graph.startNextStepDepthFirstSearch();
	}
	else if (key == 'j')
	{
		toggleDijkstra = true;
		toggleBFS = false;
		toggleDFS = false;
		graph.startDijkstra();
	}
	else if (key == 'n')
	{
		if (toggleDFS)
		{
			graph.nextStepDepthFirstSearch();	
		}
		
		if (toggleBFS)
		{
			graph.nextStepBreadthFirstSearch();
		}
		
		if (toggleDijkstra)
		{
			graph.nextStepDijkstra();
		}
	}
	else if (key == 'f')
	{
		graph.findEulerianPath();
	}
	else if (key == 'l')
	{
		if (toggleShowVertexLabel)
		{
			toggleShowVertexLabel = false;
		}
		else 
		{
			toggleShowVertexLabel = true;
		}			
	}
	else if (key == 'k')
	{
		if (toggleShowEdgeLabel)
		{
			toggleShowEdgeLabel = false;
		}
		else 
		{
			toggleShowEdgeLabel = true;
		}			
	}	
	else if (key == 'i')
	{
		if (toggleDigraph)
		{
			toggleDigraph = false;
		}
		else 
		{
			toggleDigraph = true;
		}			
	}	
	else if (key == 'r')
	{
		if (toggleRemoveVertex)
		{
			toggleRemoveVertex = false;
		}
		else 
		{
			toggleRemoveVertex = true;
			toggleAddEdge = false;
			toggleAddVertex = false;
			toggleSelectStartVertex = false;
			toggleSelectGoalVertex = false;
			vertexSelected = false;
		}			
	}
	else if (key == 's')
	{
		if (toggleSelectStartVertex)
		{
			toggleSelectStartVertex = false;
		}
		else 
		{
			toggleSelectStartVertex = true;
			toggleAddEdge = false;
			toggleAddVertex = false;
			toggleSelectGoalVertex = false;
			toggleRemoveVertex = false;
			vertexSelected = false;
		}			
	}
	else if (key == 'g')
	{
		if (toggleSelectGoalVertex)
		{
			toggleSelectGoalVertex = false;
		}
		else 
		{
			toggleSelectGoalVertex = true;
			toggleAddEdge = false;
			toggleAddVertex = false;
			toggleSelectStartVertex = false;
			toggleRemoveVertex = false;
			vertexSelected = false;
		}			
	}
	else if (key == 'v')
	{
		if (toggleAddVertex)
		{
			toggleAddVertex = false;
		}
		else 
		{
			toggleAddVertex = true;
			toggleAddEdge = false;
			toggleSelectStartVertex = false;
			toggleSelectGoalVertex = false;
			toggleRemoveVertex = false;
			vertexSelected = false;
		}			
	}	
	else if (key == 'e')
	{
		if (toggleAddEdge)
		{
			toggleAddEdge = false;
		}
		else 
		{
			toggleAddEdge = true;
			toggleAddVertex = false;
			toggleSelectStartVertex = false;
			toggleSelectGoalVertex = false;
			toggleRemoveVertex = false;
		}			
	}
}


void mousePressed()
{  
 	if (toggleAddVertex) 
	{ 
		graph.addVertex(new PVector(mouseX, mouseY));
	}
	else if (toggleAddEdge) 
	{  
		if (vertexSelected)
		{
			Vertex connectedVertex = graph.getNearestVertex(mouseX, mouseY);
			if (connectedVertex != selectedVertex)
			{
				graph.addEdge(selectedVertex, connectedVertex, toggleDigraph);
			}
			vertexSelected = false;	
		}
		else 
		{
			selectedVertex = graph.getNearestVertex(mouseX, mouseY);
			if (selectedVertex != null)
			{
				vertexSelected = true;
			}
		}
	}
	else if (toggleRemoveVertex)
	{
		Vertex selectedForRemoveVertex = graph.getNearestVertex(mouseX, mouseY);
		if (selectedForRemoveVertex != null)
		{
			graph.removeVertex(selectedForRemoveVertex);
		}
	}
	else if (toggleSelectStartVertex)
	{
		Vertex startVertex = graph.getNearestVertex(mouseX, mouseY);
		graph.setStartVertex(startVertex);
	}
	else if (toggleSelectGoalVertex)
	{
			Vertex goalVertex = graph.getNearestVertex(mouseX, mouseY);
			graph.setGoalVertex(goalVertex);
	}
} 


class Graph
{
	final int MAX_VERTICES = 100;
	
	Set<Vertex> vertexSet = new HashSet<Vertex>();
	
	Set<Edge> edgeSet = new HashSet<Edge>();

	boolean[][] adjacencyMatrix;
	
	int[][] weightedAdjacencyMatrix;

	Deque<String> vertexLabelDeque = new ArrayDeque<String>();
	
	Map<String, Integer> vertexColorMap = new HashMap<String, Integer>();

	Deque<Vertex> dfsStack = new ArrayDeque<Vertex>();
	
	Deque<Vertex> bfsQueue = new ArrayDeque<Vertex>();
	
	PriorityQueue<Vertex> dijkstraMinPriorityQueue = new PriorityQueue<Vertex>();
	
	List<Vertex> dijkstraSettledVertices = new ArrayList<Vertex>();
	
	List<Vertex> printableListOfVertices = new ArrayList<Vertex>();
	
	List<String> rowText = new ArrayList<String>();


	Graph()
	{
		int numberOfLettersInLabel = 1;
		int labelStringIndex = 0;
		String vertexLabelString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		
		for (int i = 0; i < MAX_VERTICES; i++)
		{	
			if (labelStringIndex > 25) 
			{
				labelStringIndex = 0;
				numberOfLettersInLabel++;
			}

			StringBuilder labelStringBuilder = new StringBuilder();
			String labelString = "" + vertexLabelString.charAt(labelStringIndex);
			
			for (int j = 0; j < numberOfLettersInLabel; j++)
			{
				labelStringBuilder.append(labelString);
			}
			
			vertexLabelDeque.add(labelStringBuilder.toString());
			vertexColorMap.put(labelStringBuilder.toString(), new Integer(i - ((labelStringBuilder.length() - 1) * 26)));
			
			labelStringIndex++;
		}
	}
	
	
	/**
	 *  Dijkstra's Algorithm
	 *  
	 *  Dijkstra's algorithm is a graph search algorithm that solves the single-source
	 *  shortest path problem for a graph with nonnegative edge path costs.
	 *  For a given source vertex in the graph, the algorithm find the path with the lowest cost
	 *  between that vertex and every other vertex.  
	 *  
	 *  Implemented with a minimum priority queue the 
	 *  worst case time complexity is O(|E| + |V| log |V|).
	 *
	 *  This is asymptotically the fastest known single-source shortest path algorithm 
	 *  for arbitrary directed graphs with unbounded nonnegative weights.
	 *  
	 */
	void dijkstra()
	{
		Vertex sourceVertex = getStartVertex();
		
		if (sourceVertex == null)
		{
			println("Choose a source vertex");
		}
		else 
		{
			sourceVertex.setMinimumDistanceFromSourceVertex(0);
			PriorityQueue<Vertex> minPriorityQueue = new PriorityQueue<Vertex>();
			minPriorityQueue.add(sourceVertex);
			
			while(minPriorityQueue.size() > 0)
			{
				Vertex u = minPriorityQueue.poll();
				
				// Visit each adjacent vertex
				for (Vertex v : u.getAdjacencyList())
				{
					int edgeWeight = distance(u.getVertexLocation().x, u.getVertexLocation().y, 
		                          			  v.getVertexLocation().x, v.getVertexLocation().y);

					int distanceThroughVertexU = u.getMinimumDistanceFromSourceVertex() + edgeWeight;
					
					if (distanceThroughVertexU < v.getMinimumDistanceFromSourceVertex())
					{
						minPriorityQueue.remove(v);
						v.setMinimumDistanceFromSourceVertex(distanceThroughVertexU);
						v.setPreviousVertexInDijkstraShortestPath(u);
						minPriorityQueue.add(v);
					}
				}
			}
		}
	}
	
	
	void startDijkstra()
	{
		Vertex sourceVertex = getStartVertex();
		
		if (sourceVertex == null)
		{
			println("Choose a source vertex");
		}
		else 
		{
			sourceVertex.setMinimumDistanceFromSourceVertex(0);
			dijkstraMinPriorityQueue = new PriorityQueue<Vertex>();
			dijkstraMinPriorityQueue.add(sourceVertex);
			
			// Print vertices
			StringBuffer row = new StringBuffer();
			for (Vertex vertex : printableListOfVertices)
        	{
            	print(" " + vertex.toString() + "    "); 
            	row.append(" " + vertex.toString() + "    ");
        	}
        	println();
        	rowText.add(row.toString());
        	
        	printDijkstraDistanceFromSource();
		}
		
	}
	
	
	void nextStepDijkstra()
	{
		if (dijkstraMinPriorityQueue.size() > 0)
		{
			Vertex u = dijkstraMinPriorityQueue.poll();
				
			dijkstraSettledVertices.add(u);
				
			// Visit each adjacent vertex
			for (Vertex v : u.getAdjacencyList())
			{
				int edgeWeight = distance(u.getVertexLocation().x, u.getVertexLocation().y, 
		                          		  v.getVertexLocation().x, v.getVertexLocation().y);

				int distanceThroughVertexU = u.getMinimumDistanceFromSourceVertex() + edgeWeight;
					
				if (distanceThroughVertexU < v.getMinimumDistanceFromSourceVertex())
				{
					dijkstraMinPriorityQueue.remove(v);
					v.setMinimumDistanceFromSourceVertex(distanceThroughVertexU);
					v.setPreviousVertexInDijkstraShortestPath(u);
					dijkstraMinPriorityQueue.add(v);
				}
			}
			
			graph.printDijkstraDistanceFromSource();
		}
		else
		{
			println(getShortestPathToGoal());
		}
	}
	
	
	
	
	void printDijkstraDistanceFromSource()
    {
    	StringBuffer row = new StringBuffer();
        for (Vertex vertex : printableListOfVertices)
        {
        	if(dijkstraSettledVertices.contains(vertex))
        	{
        		print(" /    ");
        		row.append(" /    ");
        	}
        	else
        	{
        	
	        	if (vertex.getMinimumDistanceFromSourceVertex().equals(Integer.MAX_VALUE))
	        	{
	        		print("Inf   ");
	        		row.append("Inf   ");
	        	}
	        	else
	        	{
	            	print(String.format("%2d   ", vertex.getMinimumDistanceFromSourceVertex())); 
	        		row.append(String.format("%2d   ", vertex.getMinimumDistanceFromSourceVertex()));
	        	}
        	}
        }
        println();
        rowText.add(row.toString());
    }
    
    
    List<Vertex> getShortestPathToGoal()
    {
    	Vertex goalVertex = getGoalVertex();
		
		if (goalVertex == null)
		{
			println("Choose a goal vertex");
		}
		
        List<Vertex> shortestPath = new ArrayList<Vertex>();
        
        for (Vertex vertex = goalVertex; vertex != null; vertex = vertex.getPreviousVertexInDijkstraShortestPath())
        {
            shortestPath.add(vertex);
        }
        
        Collections.reverse(shortestPath);

        Vertex previousVertex = null;
        for (Vertex vertex : shortestPath)
        {
        	if (previousVertex == null)
        	{
        		vertex.setVisited(true);	
        	}
        	else
        	{
        		visit(previousVertex, vertex);
        	}
        	previousVertex = vertex;
        }
        
        return shortestPath;
    }
	
	
	void breadthFirstSearch()
	{
		Vertex startVertex = getStartVertex();
		
		if (startVertex == null)
		{
			println("Choose a start vertex");
		}
		else 
		{
			Deque<Vertex> queue = new ArrayDeque<Vertex>();
			queue.addLast(startVertex);
			println(startVertex.getVertexLabel());
			startVertex.setVisited(true);
			
			while (queue.size() > 0)
			{
				Vertex vertex = queue.removeFirst();	
				List<Vertex> adjacencyList = vertex.getAdjacencyList();
				for (Vertex adjacentVertex : adjacencyList)
				{
					if (!adjacentVertex.isVisited())
					{
						println(adjacentVertex.getVertexLabel());
						visit(vertex, adjacentVertex);
						queue.addLast(adjacentVertex);	
					}
				}
			}
		}
	}
	
	
	void startNextStepBreadthFirstSearch()
	{
		Vertex startVertex = getStartVertex();
		
		if (startVertex == null)
		{
			println("Choose a start vertex");
		}
		else 
		{
			bfsQueue.addLast(startVertex);
			println(startVertex.getVertexLabel());
			startVertex.setVisited(true);
		}
	}
	
	
	void nextStepBreadthFirstSearch()
	{
		if (bfsQueue.size() > 0)
		{
			Vertex vertex = bfsQueue.removeFirst();	
			List<Vertex> adjacencyList = vertex.getAdjacencyList();
			for (Vertex adjacentVertex : adjacencyList)
			{
				if (!adjacentVertex.isVisited())
				{
					println(adjacentVertex.getVertexLabel());
					visit(vertex, adjacentVertex);
					bfsQueue.addLast(adjacentVertex);
				}
			}
		}
	}
	
	
	void depthFirstSearch()
	{
		Vertex startVertex = getStartVertex();
		
		if (startVertex == null)
		{
			println("Choose a start vertex");
		}
		else 
		{
			Deque<Vertex> stack = new ArrayDeque<Vertex>();
			stack.push(startVertex);
			println(startVertex.getVertexLabel());
			startVertex.setVisited(true);
			
			while (stack.size() > 0)
			{
				Vertex vertex = stack.peek();	
				Vertex unvisitedAdjacentVertex = vertex.getUnvisitedAdjacentVertex();
				
				if (unvisitedAdjacentVertex != null)
				{
					println(unvisitedAdjacentVertex.getVertexLabel());
					visit(vertex, unvisitedAdjacentVertex);
					stack.push(unvisitedAdjacentVertex);
				}
				else 
				{
					stack.pop();
				}	
			}
		}
	}
	
	
	void startNextStepDepthFirstSearch()
	{
		Vertex startVertex = getStartVertex();
		
		if (startVertex == null)
		{
			println("Choose a start vertex");
		}
		else 
		{
			dfsStack.push(startVertex);
			println(startVertex.getVertexLabel());
			startVertex.setVisited(true);
		}
	}
	
	
	void nextStepDepthFirstSearch()
	{
		if (dfsStack.size() > 0)
		{
			Vertex vertex = dfsStack.peek();	
			Vertex unvisitedAdjacentVertex = vertex.getUnvisitedAdjacentVertex();
					
			if (unvisitedAdjacentVertex != null)
			{
				println(unvisitedAdjacentVertex.getVertexLabel());
				visit(vertex, unvisitedAdjacentVertex);
				dfsStack.push(unvisitedAdjacentVertex);
			}
			else 
			{
				dfsStack.pop();
			}	
		}
	}
	
	
	void visit(Vertex vertex, Vertex unvisitedAdjacentVertex)
	{
		unvisitedAdjacentVertex.setVisited(true);
		for(Edge edge : edgeSet)
		{
			if (!toggleDigraph)
			{
				if (edge.getStartVertex().equals(vertex) && edge.getEndVertex().equals(unvisitedAdjacentVertex) || edge.getEndVertex().equals(vertex) && edge.getStartVertex().equals(unvisitedAdjacentVertex))
				{
					edge.setTraversed(true);
				}
			}
			else
			{
				if (edge.getStartVertex().equals(vertex) && edge.getEndVertex().equals(unvisitedAdjacentVertex))
				{
					edge.setTraversed(true);
				}
			}
			
		}
	}
	
	
	Vertex getStartVertex()
	{
		Vertex startVertex = null;
		for (Vertex vertex : vertexSet)
		{
			if (vertex.isStartVertex())
			{
				startVertex = vertex;
			}
		}	
		
		return startVertex;
	}
	
	
	Vertex getGoalVertex()
	{
		Vertex goalVertex = null;
		for (Vertex vertex : vertexSet)
		{
			if (vertex.isGoalVertex())
			{
				goalVertex = vertex;
			}
		}	
		
		return goalVertex;
	}
	
	
	void clearVisitedVertices()
	{
		for (Vertex vertex : vertexSet)
		{
			vertex.setVisited(false);
			vertex.setMinimumDistanceFromSourceVertex(Integer.MAX_VALUE);
			vertex.setPreviousVertexInDijkstraShortestPath(null);
		}	
		dijkstraMinPriorityQueue = new PriorityQueue<Vertex>();
	    dijkstraSettledVertices = new ArrayList<Vertex>();
	    rowText = new ArrayList<String>();
	}
	
	
	void clearTraversedEdges()
	{
		for (Edge edge : edgeSet)
		{
			edge.setTraversed(false);
		}		
	}
	
	
	Vertex addVertex(PVector pVector)
	{
		Vertex vertex = null;
		
		if (vertexSet.size() < MAX_VERTICES)
		{
			String vertexLabel = vertexLabelDeque.removeFirst();
			colorMode(HSB, 25, 100, 100);
			vertex = new Vertex(vertexLabel, color(vertexColorMap.get(vertexLabel), 100, 100), pVector);
			vertexSet.add(vertex);
			printableListOfVertices.add(vertex);
		}
		
		updateGraph();
		
		return vertex;
	}


	void removeVertex(Vertex selectedForRemoveVertex)
	{
		String selectedForRemoveVertexLabel = selectedForRemoveVertex.getVertexLabel();
		
		Set<Edge> edgeToRemoveSet = new HashSet<Edge>();
		
		for (Edge edge : edgeSet)
		{
			if (selectedForRemoveVertex == edge.getStartVertex())
			{
				edge.getEndVertex().removeAdjacent(selectedForRemoveVertex);
				edgeToRemoveSet.add(edge);
			}
			else if (selectedForRemoveVertex == edge.getEndVertex())
			{
				edge.getStartVertex().removeAdjacent(selectedForRemoveVertex);
				edgeToRemoveSet.add(edge);
			}
		}
		
		for (Edge edge : edgeToRemoveSet)
		{
			edgeSet.remove(edge);
		}
		
		vertexSet.remove(selectedForRemoveVertex);
		printableListOfVertices.remove(selectedForRemoveVertex);
		vertexLabelDeque.push(selectedForRemoveVertexLabel);
		updateGraph();
	}
	
	
	void addEdge(Vertex vertex1, Vertex vertex2, boolean directional)
	{
		int edgeWeight = distance(vertex1.getVertexLocation().x, vertex1.getVertexLocation().y, 
		                          vertex2.getVertexLocation().x, vertex2.getVertexLocation().y);
		Edge edge = new Edge(vertex1, vertex2, edgeWeight, directional);
		edgeSet.add(edge);
		
		vertex1.addAdjacent(vertex2);
		
		if (!directional)
		{
			vertex2.addAdjacent(vertex1);
		}
		
		updateGraph();
	}


    int distance(float x1, float y1, float x2, float y2)
    {
		return round(sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)) / 10);
    }


	void updateAdjacencyMatrix()
	{
		adjacencyMatrix = new boolean[vertexSet.size()][vertexSet.size()];
		
		int i = 0;
		for (Vertex vertexI : vertexSet)
		{
			int j = 0;
			for (Vertex vertexJ : vertexSet)
			{
				adjacencyMatrix[i][j] = vertexI.isAdjacent(vertexJ);
				adjacencyMatrix[j][i] = vertexJ.isAdjacent(vertexI);
				j++;
			}
			i++;
		}
	}
	
	
	void updateWeightedAdjacencyMatrix()
	{
		weightedAdjacencyMatrix = new int[vertexSet.size()][vertexSet.size()];
		
		int i = 0;
		for (Vertex vertexI : vertexSet)
		{
			int j = 0;
			for (Vertex vertexJ : vertexSet)
			{
				if(vertexI.isAdjacent(vertexJ))
				{
					int edgeWeight = distance(vertexI.getVertexLocation().x, vertexI.getVertexLocation().y, 
					                          vertexJ.getVertexLocation().x, vertexJ.getVertexLocation().y);
					                          
					weightedAdjacencyMatrix[i][j] = edgeWeight;
				}
				else
				{
					weightedAdjacencyMatrix[i][j] = Integer.MAX_VALUE;
				}
				
				if (vertexJ.isAdjacent(vertexI))
				{
					int edgeWeight = distance(vertexJ.getVertexLocation().x, vertexJ.getVertexLocation().y, 
					                          vertexI.getVertexLocation().x, vertexI.getVertexLocation().y);
					                          
					weightedAdjacencyMatrix[j][i] = edgeWeight;
				}
				else
				{
					weightedAdjacencyMatrix[j][i] = Integer.MAX_VALUE;	
				}

				j++;
			}
			i++;
		}
	}
	
	
	void updateGraph()
	{
		updateAdjacencyMatrix();
		updateWeightedAdjacencyMatrix();
	}
	
	
	void show(boolean showVertexLabel, boolean showEdgeLabel)
	{
		textSize(18);
		
		for (Edge edge : edgeSet)
		{
			edge.show(showEdgeLabel);
		}
		
		for (Vertex vertex : vertexSet)
		{
			vertex.show(showVertexLabel);
		}
		
		boolean firstRow = true;
		int textHeight = 55;
		for (String row : rowText)
		{
			if (firstRow)
			{
				textSize(22);
				firstRow = false;
			}
			else
			{
				fill(0, 102, 153);
			}
			text(row, 20, textHeight);
			fill(0);
			textHeight += 20;
		}
		
		if (toggleDijkstra)
		{
			stroke(EDGE_COLOR);
			strokeWeight(EDGE_STROKE_WEIGHT);
			textSize(22);
			text("Distance from source vertex:", 20, 30);
			line(15, 35, 300, 35);
			text("Settled vertices:", 20, 400);
			textSize(18);
			line(15, 405, 180, 405);
			textHeight = 425;
			for (Vertex vertex : dijkstraSettledVertices)
			{
				fill(0, 102, 153);
				text(vertex.toString() + "(" + vertex.getMinimumDistanceFromSourceVertex() + ")", 20, textHeight);
				textHeight += 20;
			}
			fill(0);
		}
	}
	
	
	Vertex getNearestVertex(float x, float y)
	{
		Vertex nearestVertex = null;
		float nearestDistance = 0; 
		boolean firstVertexChecked = true;
		
		for (Vertex vertex : vertexSet)
		{
			PVector location = vertex.getVertexLocation();
			float distance = dist(x, y, location.x, location.y);
			
			if (firstVertexChecked)
			{
				nearestDistance = dist(x, y, location.x, location.y);
				nearestVertex = vertex;
				firstVertexChecked = false;
			}
			else if (distance < nearestDistance)
			{
				nearestDistance = distance;
				nearestVertex = vertex;
			}
		}
		
		return nearestVertex;
	}
	
	
	void setStartVertex(Vertex startVertex)
	{
		if (!startVertex.isStartVertex())
		{
			for (Vertex vertex : vertexSet)
			{
				if (vertex.isStartVertex())
				{
					vertex.setStartVertex(false);
				}
			}
			startVertex.setStartVertex(true);
			startVertex.setGoalVertex(false);
		}
		else 
		{
			startVertex.setStartVertex(false);	
		}
	}
	
	
	void setGoalVertex(Vertex goalVertex)
	{
		if (!goalVertex.isGoalVertex())
		{
			for (Vertex vertex : vertexSet)
			{
				if (vertex.isGoalVertex())
				{
					vertex.setGoalVertex(false);
				}
			}
			goalVertex.setGoalVertex(true);
			goalVertex.setStartVertex(false);
		}
		else 
		{
			goalVertex.setGoalVertex(false);	
		}
	}
	
	
	void findEulerianPath()
	{
		Vertex startVertex = null;
		
		for (Vertex vertex : vertexSet)
		{
			if (vertex.isStartVertex())
			{
				startVertex = vertex;
			}
		}		
		
		if (startVertex != null)
		{
			List<Vertex> previousStartVertexList = new ArrayList<Vertex>();
			int previousStartVertexListIndex = 0;
			
			while (true)
			{
				Edge edgeToRemove = null;
				
				for (Edge edge : edgeSet)
				{
					if (startVertex == edge.getStartVertex())
					{
						edgeToRemove = edge;
						previousStartVertexList.add(startVertex);
						startVertex = edge.getEndVertex();
						break;
					}
					else if (startVertex == edge.getEndVertex())
					{
						edgeToRemove = edge;
						previousStartVertexList.add(startVertex);
						startVertex = edge.getStartVertex();
						break;
					}
				}						
				
				if (edgeToRemove != null)
				{
					println("Remove: " + edgeToRemove.getEdgeLabel());
					edgeSet.remove(edgeToRemove);
				}
				else if (edgeSet.isEmpty())
				{
					println("EMPTY Edge Set");
					break;
				}
				else 
				{
					startVertex	= previousStartVertexList.get(previousStartVertexListIndex);
					previousStartVertexListIndex++;
				}
			}
		}
	}
	
	
	boolean isEdge(Vertex startVertex, Vertex endVertex)
	{
		boolean isEdge = false;
		
		for (Edge edge : edgeSet)
		{
			if (edge.getStartVertex().equals(startVertex) && edge.getEndVertex().equals(endVertex))
			{
				isEdge = true;
				break;
			}
		}
		
		return isEdge;
	}	
	
	
	void printGraphInformation()
	{
		println("Number of Edges = " + edgeSet.size());
		println("Total number of Degrees = " + (edgeSet.size() * 2));
		println("Number of Vertices = " + vertexSet.size());	
		
		for (Edge edge : edgeSet)
		{
			edge.showPrint();
		}
		
		for (Vertex vertex : vertexSet)
		{
			vertex.showPrint();
		}	
				
		println();
		print("Edges:  (");
		for (Edge edge : edgeSet)
		{
			print(" " + edge.getEdgeLabel());
		}
		print(" )\n");
		
		print("Vertices:  (");
		for (Vertex vertex : vertexSet)
		{
			print(" " + vertex.getVertexLabel());
		}
		print(" )\n");			
	}
	
	
	void printAdjacencyMatrix()
	{
		println("Adjacency Matrix:");
		for(int index = 0; index < vertexSet.size(); index++)
		{
			println(Arrays.toString(adjacencyMatrix[index]));
		}
		println();
	}
	
	
	void printWeightedAdjacencyMatrix()
	{
		println("Weighted Adjacency Matrix:");
		for(int index = 0; index < vertexSet.size(); index++)
		{
			println(Arrays.toString(weightedAdjacencyMatrix[index]));
		}
		println();
	}
}


class Edge
{
	Vertex startVertex;
	
	Vertex endVertex;	
	
	boolean directional;
	
	int edgeWeight;

	String edgeLabel;
	
	boolean traversed;
	
	
	Edge(Vertex startVertex, Vertex endVertex, int edgeWeight, boolean directional)
	{
		this.startVertex = startVertex;
		this.endVertex = endVertex;
		this.directional = directional;
		this.edgeLabel = startVertex.getVertexLabel() + endVertex.getVertexLabel();
		this.edgeWeight = edgeWeight;
	}
    	
    	
	void show(boolean showEdgeLabel) 
	{
		PVector startLocation = startVertex.getVertexLocation();
		PVector endLocation = endVertex.getVertexLocation();
		
		stroke(EDGE_COLOR);
		strokeWeight(EDGE_STROKE_WEIGHT);
		
		if (traversed)
		{
			stroke(TRAVERSED_EDGE_COLOR);
			strokeWeight(TRAVERSED_EDGE_STROKE_WEIGHT);	
		}
		
		line(startLocation.x, startLocation.y, endLocation.x, endLocation.y);	
		
		if (toggleDigraph)
		{
			float lineAngle =  atan2(startLocation.y - endLocation.y, startLocation.x - endLocation.x);
			float arrowAngle = PI / 12;
	    	float arrowSize = 9;
	    	fill(EDGE_COLOR);
	    	triangle(lerp(startLocation.x, endLocation.x, 0.5), lerp(startLocation.y, endLocation.y, 0.5), 
	    		lerp(startLocation.x, endLocation.x, 0.5) + (arrowSize * cos(lineAngle + arrowAngle)), lerp(startLocation.y, endLocation.y, 0.5) + (arrowSize * sin(lineAngle + arrowAngle)),
	    		lerp(startLocation.x, endLocation.x, 0.5) + (arrowSize * cos(lineAngle - arrowAngle)), lerp(startLocation.y, endLocation.y, 0.5) + (arrowSize * sin(lineAngle - arrowAngle)));
		}
		
		if (showEdgeLabel)
		{
			fill(EDGE_COLOR);
			text(edgeWeight, 
				lerp(startLocation.x, endLocation.x, 0.5) + 5, 
				lerp(startLocation.y, endLocation.y, 0.5) - 5);
		}		
	}
	
	
	void showPrint() 
	{
		print("Edge:  " + edgeLabel + "  (" + edgeWeight + ")");

		if (directional)
		{
			print("  *directional");
		}
		
		println();
	}
	
	
	boolean isDirectional()
	{
		return directional;
	}
	
	
	Vertex getStartVertex()
	{
		return startVertex;
	}
	
	
	Vertex getEndVertex()
	{
		return endVertex;
	}
	

	int getEdgeWeight()
	{
		return edgeWeight;		
	}
	
	
	String getEdgeLabel()
	{
		return edgeLabel;
	}
	
	
	boolean isTraversed()
	{
		return traversed;
	}
	
	
	void setTraversed(boolean traversed)
	{
		this.traversed = traversed;
	}
}


class Vertex implements Comparable<Vertex>
{
	String vertexLabel;
	
	color vertexColor;
	
	PVector vertexLocation;
	
	// Used for graph applications like DFS, BFS
	boolean startVertex;
	
	// Used for graph applications.
	boolean goalVertex;
	
	boolean visited;
	
	List<Vertex> adjacencyList;
	
	// Used for Dijkstra
	Integer minimumDistanceFromSourceVertex = Integer.MAX_VALUE;
	
	Vertex previousVertexInDijkstraShortestPath;
	

	Vertex(String vertexLabel, color vertexColor, PVector vertexLocation)
	{
		this.vertexLabel = vertexLabel;
		this.vertexColor = vertexColor;
		this.vertexLocation = vertexLocation;
		this.startVertex = false;
		this.goalVertex = false;
		this.visited = false;
		adjacencyList = new ArrayList<Vertex>();
	}	


	void show(boolean showVertexLabel)
	{
		if (visited)
		{
			stroke(VISITED_VERTEX_STROKE_COLOR);
			strokeWeight(VISITED_VERTEX_STROKE_WEIGHT);	
		}
		else 
		{
			noStroke();
		}
		
		fill(vertexColor);
		ellipse(vertexLocation.x, vertexLocation.y, VERTEX_DIAMETER, VERTEX_DIAMETER);
		
		if (showVertexLabel)
		{
			fill(0);
			if (toggleDijkstra)
			{
				if (minimumDistanceFromSourceVertex.equals(Integer.MAX_VALUE))
				{
					text(vertexLabel + " (Infinity)", vertexLocation.x + (VERTEX_DIAMETER / 2.5), vertexLocation.y - (VERTEX_DIAMETER / 2.5));	
				}
				else
				{
					text(vertexLabel + " (" + minimumDistanceFromSourceVertex.toString() + ")", vertexLocation.x + (VERTEX_DIAMETER / 2.5), vertexLocation.y - (VERTEX_DIAMETER / 2.5));	
				}
			}
			else
			{
				text(vertexLabel + " (" + adjacencyList.size() + ")", vertexLocation.x + (VERTEX_DIAMETER / 2.5), vertexLocation.y - (VERTEX_DIAMETER / 2.5));	
			}
		}
		
		if (startVertex)
		{
			fill(0);
			textAlign(CENTER);
			text("Start", vertexLocation.x, vertexLocation.y);
			textAlign(LEFT);
		}
		else if (goalVertex)
		{
			fill(0);
			textAlign(CENTER);
			text("Goal", vertexLocation.x, vertexLocation.y);	
			textAlign(LEFT);
		}
	}
	
	
	void showPrint()
	{
		print("Vertex:  " + vertexLabel + "  (" + adjacencyList.size() + ")");	

		if (startVertex)
		{
			print("  *Start");
		}
		else if (goalVertex)
		{
			print("  *Goal");			
		}
		
		print("\n");
	}
	
	
	PVector getVertexLocation()
	{
		return vertexLocation;
	}
	
	
	String getVertexLabel()
	{
		return vertexLabel;
	}
	
	
	color getVertexColor()
	{
		return vertexColor;
	}
	
	
	boolean isStartVertex()
	{
		return startVertex;
	}
	
	
	void setStartVertex(boolean startVertex)
	{
		this.startVertex = startVertex;	
	}
	
	
	boolean isGoalVertex()
	{
		return goalVertex;
	}
	
	
	void setGoalVertex(boolean goalVertex)
	{
		this.goalVertex = goalVertex;	
	}
	
	
	void addAdjacent(Vertex adjacentVertex)
	{
		adjacencyList.add(adjacentVertex);
	}
	
	
	void removeAdjacent(Vertex adjacentVertex)
	{
		adjacencyList.remove(adjacentVertex);
	}


	Vertex getUnvisitedAdjacentVertex()
	{
		Vertex unvisitedAdjacentVertex = null;
		
		for (Vertex adjacentVertex : adjacencyList)
		{
			if (!adjacentVertex.isVisited())
			{
				unvisitedAdjacentVertex = adjacentVertex;
				break;
			}
		}
		
		return unvisitedAdjacentVertex;
	}
	

	List<Vertex> getAdjacencyList()
	{
		return adjacencyList;
	}
	
	boolean isAdjacent(Vertex vertex)
	{
		return adjacencyList.contains(vertex);
	}
	
	int getDegree()
	{
		return adjacencyList.size();	
	}

	
	boolean isVisited()
	{
		return visited;
	}
	
	
	void setVisited(boolean visited)
	{
		this.visited = visited;
	}


	Integer getMinimumDistanceFromSourceVertex()
	{
		return minimumDistanceFromSourceVertex;
	}
	
	
	void setMinimumDistanceFromSourceVertex(Integer minimumDistanceFromSourceVertex)
	{
		this.minimumDistanceFromSourceVertex = minimumDistanceFromSourceVertex;
	}


	Vertex getPreviousVertexInDijkstraShortestPath()
	{
		return previousVertexInDijkstraShortestPath;
	}
	
	
	void setPreviousVertexInDijkstraShortestPath(Vertex previousVertexInDijkstraShortestPath)
	{
		this.previousVertexInDijkstraShortestPath = previousVertexInDijkstraShortestPath;
	}
	
	
	int compareTo(Vertex vertex)
    {
        return minimumDistanceFromSourceVertex.compareTo(vertex.getMinimumDistanceFromSourceVertex());
    }


	String toString()
	{
		return vertexLabel;
	}
	
	
	boolean equals(Vertex vertex)
	{
		return vertex.getVertexLabel().equals(vertexLabel);
	}
}

