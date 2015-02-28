

Node a1, a2, a3, a4, a5, a6, a7;
Edge e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11;
ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Edge> edges=new ArrayList<Edge>();
Dijkstra d;
void setup() {

  size(800, 500);
  background(#FADC88);
  smooth();
  a1=new Node(20, 40, 0);
  a2=new Node(500, 100, 1);
  a3=new Node(300, 300, 2);
  a4=new Node(40, 400, 3);
  a5=new Node(100, 250, 4);
  a6=new Node(250, 460, 5);
  a7=new Node(550, 400, 6);
  e1=new Edge(a1, a2, 4);
  e2=new Edge(a2, a3, 6);
  e3=new Edge(a3, a4, 5);
  e4=new Edge(a4, a5, 9);
  e5=new Edge(a1, a5, 2);
  e6=new Edge(a5, a2, 5);
  e7=new Edge(a3, a5, 2);
  e8=new Edge(a4, a6, 5);
  e9=new Edge(a3, a7, 2);
  e10=new Edge(a6, a7, 1);
  e11=new Edge(a2, a7, 3);
  nodes.add(a1);
  nodes.add(a2);
  nodes.add(a3);
  nodes.add(a4);
  nodes.add(a5);
  nodes.add(a6);
  nodes.add(a7);
  edges.add(e1);
  edges.add(e2);
  edges.add(e3);
  edges.add(e4);
  edges.add(e5);
  edges.add(e6);
  edges.add(e7);
  edges.add(e8);
  edges.add(e9);
  edges.add(e10);
  edges.add(e11);
}
void keyPressed()
{
  if (key == '0')
  {
    d=new Dijkstra(nodes, edges, 0);
    d.startOver();
    background(#FADC88);
    d=new Dijkstra(nodes, edges, 0);
    d.dijkstra();
    d.render();
    textSize(30);
    stroke(0);
    text("Selecting Vertex: 0", 520, 45);
  }
  if (key == '1')
  {
    d=new Dijkstra(nodes, edges, 1);
    d.startOver();
    background(#FADC88);
    d=new Dijkstra(nodes, edges, 1);
    d.dijkstra();
    d.render();
    textSize(30);
    stroke(0);
    text("Selecting Vertex: 1", 520, 45);
  }
  if (key == '2')
  {
    d=new Dijkstra(nodes, edges, 2);
    d.startOver();
    background(#FADC88);
    d=new Dijkstra(nodes, edges, 2);
    d.dijkstra();
    d.render();
    textSize(30);
    stroke(0);
    text("Selecting Vertex: 2", 520, 45);
  }
  if (key == '3')
  {
    d=new Dijkstra(nodes, edges, 3);
    d.startOver();
    background(#FADC88);
    d=new Dijkstra(nodes, edges, 3);
    d.dijkstra();
    d.render();
    textSize(30);
    stroke(0);
    text("Selecting Vertex: 3", 520, 45);
  }
  if (key == '4')
  {
    d=new Dijkstra(nodes, edges, 4);
    d.startOver();
    background(#FADC88);
    d=new Dijkstra(nodes, edges, 4);
    d.dijkstra();
    d.render();
    textSize(30);
    stroke(0);
    text("Selecting Vertex: 4", 520, 45);
  }
  if (key == '5')
  {
    d=new Dijkstra(nodes, edges, 5);
    d.startOver();
    background(#FADC88);
    d=new Dijkstra(nodes, edges, 5);
    d.dijkstra();
    d.render();
    textSize(30);
    stroke(0);
    text("Selecting Vertex: 5", 520, 45);
  }
  if (key == '6')
  {
    d=new Dijkstra(nodes, edges, 6);
    d.startOver();
    background(#FADC88);
    d=new Dijkstra(nodes, edges, 6);
    d.dijkstra();
    d.render();
    textSize(30);
    stroke(0);
    text("Selecting Vertex: 6", 520, 45);
  }
  if (key == 'c')
  {
    
    d=new Dijkstra(nodes, edges, 0);
   
    background(#FADC88);
    d.startOver();
  }
  /*
  if (key == 'd'){
   background(#FADC88);
   image(img,0,0);
   }
   */
}
void draw() {
  for (Edge d: edges) {
    d.render();
  }
  for (Node n : nodes) {
    n.render();
  }

  /*
  Node start=nodes.get(0);
   start.setFinalDistance(0);
   Node end=nodes.get(nodes.size()-1);
   ArrayList<Node> checkedNodes=new ArrayList<Node>();
   checkedNodes.add(start);//check nodes and add them in to the checkedNodes;
   ArrayList<Edge> checkedEdges=new ArrayList<Edge>();
   
   Node shortestDistanceNode=null;
   Node thisNode=null;
   int shortestDistance=0;
   for (Node c: checkedNodes) {
   if (c.checkableNode()==true) {
   Node s=c.shortestDistanceNode();
   s.setDistance(c);
   int d=s.getDistance();
   if (shortestDistance==0||d<shortestDistance) {
   shortestDistance=d;
   shortestDistanceNode=s;
   thisNode=c;
   }
   }
   }
   
   println(shortestDistanceNode.getConnectedEdge(thisNode).getCheck());
   Edge thisEdge=shortestDistanceNode.getConnectedEdge(thisNode);
   thisEdge.edgeColor=true;
   shortestDistanceNode.setFinalDistance(shortestDistance);
   checkedEdges.add(thisEdge);          //add checked edge in to the checked edges arraylist
   println(thisNode.getDistance());
   println(shortestDistanceNode.getDistance());
   
   
   
   
   ArrayList<Node> good=new ArrayList<Node>();
   ArrayList<Node> sogoood=new ArrayList<Node>();
   
   good.add(null);
   good.add(a1);
   for(Node n:good){
   if (n!=null){
   sogoood.add(n);
   }
   }
   println(sogoood);
   
   
   */
}

public class Node {
  ArrayList<Edge> connectedEdges=new ArrayList<Edge>();
  float x, y;
  int s, distance; 
  boolean checked;

  public Node(float x, float y, int s) {
    this.x=x;
    this.y=y;
    this.s=s; 
    checked=false; 
    distance=Integer.MAX_VALUE;
  }

  public void addEdge(Edge e) {
    connectedEdges.add(e);
  }
  //return all the edges connected to this node
  public ArrayList<Edge> getEdge() {
    return connectedEdges;
  }
  //return distance from the starting node to this node
  public int getDistance() {
    return distance;
  }

  //if the edge connected to this node and the previous node is checked, then set the final distance for this node.
  public void setFinalDistance(int i) {
    distance=i;
  }

  public void setDistance(Node previousNode) {
    ///////////////////////
    for (Edge e:connectedEdges) {
      if (e.getNode().get(0).equals(previousNode)||e.getNode().get(1).equals(previousNode)) {
        this.distance=previousNode.getDistance()+e.getWeight();
      }
    }
  } 
  // check if there's still unchecked edges that is connected to this node, if there are, then it is a checkable node.
  public boolean checkableNode() {

    for (Edge e:getEdge()) {
      if (e.getCheck()==false) {
        return true;
      }
    }
    return false;
  }
  //get the closest node that is connected to this node if the edge that is connected to that node has not been checked.
  // if all the edges has been checked return null.
  public Node shortestDistanceNode() {
    ArrayList<Edge> notCheckedEdges= new ArrayList<Edge>();
    for (Edge e:connectedEdges) {
      if (e.getCheck()==false) {
        notCheckedEdges.add(e);
      }
    }
    if (notCheckedEdges.size()==0) {
      return null;
    }
    Edge n=notCheckedEdges.get(0);
    for (Edge e:notCheckedEdges) {
      if (e.getWeight()<n.getWeight()&&e.getCheck()==false) {
        n=e;
      }
    }
    return n.getPreviousNode(this);
  }
  //find the connected Edge of this node and another node n;
  public Edge getConnectedEdge(Node n) {
    Edge ed=null;
    for (Edge e:connectedEdges) {
      for (Node node:e.getNode()) {
        if (node.equals(n)) ed=e;
      }
    }
    return ed;
  }
  public ArrayList<Node> destinationNodes() {
    ArrayList<Node> destination=new ArrayList<Node>();
    for (Edge e:getEdge()) {
      destination.add(e.getPreviousNode(this));
    }
    return destination;
  }
  public void setCheck() {
    checked=true;
  }
  public boolean getCheck() {
    return checked;
  }


  public void render() {
    if (distance!=Integer.MAX_VALUE) {
      fill(#A231DB);
      ellipse(x, y, 40, 40);
      textSize(30);
      fill(255);
      text(""+s, x-9, y+10);
      textSize(20);
      fill(0);
      text("Shortest Distance: "+distance, x+30, y+25);
    }
    else {
      fill(0, 255, 0);
      ellipse(x, y, 40, 40);
      textSize(30);
      fill(0);
      text(""+s, x-9, y+10);
    }
  }
}
public class Edge {
  ArrayList<Node> nodesInEdge;
  Node a, b;
  int weight;
  PVector midPoint;
  boolean checked; 
  boolean edgeColor;
  public Edge(Node a, Node b, int w) {
    this.a=a; 
    this.b=b;
    this.weight=w;
    midPoint=getMidpoint();
    a.addEdge(this);
    b.addEdge(this);
    nodesInEdge=new ArrayList<Node>();
    nodesInEdge.add(a); 
    nodesInEdge.add(b);
    checked=false;
    edgeColor=false;
  }
  // return the weight of this edge
  public int getWeight() {
    return weight;
  }
  public PVector getMidpoint() {

    return new PVector((a.x+b.x)/2, (a.y+b.y)/2);
  }

  //return the nodes in this edge
  public ArrayList<Node> getNode() {
    return nodesInEdge;
  }
  public void setCheck() {
    checked=true;
  }
  public boolean getCheck() {
    return checked;
  }
  // get the other node in this edge;
  public Node getPreviousNode(Node n) {
    if (nodesInEdge.get(0).equals(n)) {
      return nodesInEdge.get(1);
    }
    else {
      return nodesInEdge.get(0);
    }
  }

  public void render() {

    if (edgeColor==true) {
      stroke(0);
      line(a.x, a.y, b.x, b.y);
      textSize(20);
      text(""+weight, midPoint.x-20, midPoint.y+5);
    }
    else {
      stroke(#07F524);
      line(a.x, a.y, b.x, b.y);
      fill(255, 0, 0);
      textSize(20);
      text(""+weight, midPoint.x-20, midPoint.y+5);
    }
  }
}

public class Dijkstra {
  ArrayList<Node> nodes;
  ArrayList<Edge> edges;
  ArrayList<Node> settledNodes=new ArrayList<Node>();
  ArrayList<Node> unsettledNodes=new ArrayList<Node>();
  Node start;
  Node end;
  int i;

  public Dijkstra(ArrayList<Node> nodes, ArrayList<Edge> edges, int i) {
    this.nodes=nodes; 
    this.edges=edges;
    this.i=i;
    start=nodes.get(i);
    end=nodes.get(nodes.size()-1);
    start.setFinalDistance(0);
    unsettledNodes.add(start);
  }

  public void render() {
    for (Edge d: edges) {
      d.render();
    }
    for (Node n : nodes) {
      n.render();
    }
  }

  public Node getNodeWithLowestDistance(ArrayList<Node> unsettledNodes) {
    Node no=unsettledNodes.get(0);
    for (Node n:unsettledNodes) {
      if (n.getDistance()<n.getDistance()) {
        return no=n;
      }
    }
    return no;
  }

  public void evaluatedNeighbors(Node evaluationNode) {
    for (Node d:evaluationNode.destinationNodes()) {
      for (Node s:settledNodes) {
        if (d!=s) {
          int edgeDistance=(d.getConnectedEdge(evaluationNode)).getWeight();
          int newDistance=edgeDistance+evaluationNode.getDistance();
          if (d.getDistance()>newDistance) {
            d.setFinalDistance(newDistance);
            unsettledNodes.add(d);
          }
        }
      }
    }
  }

  public void dijkstra() {
    while (unsettledNodes.size ()!=0) {
      Node evaluationNode=getNodeWithLowestDistance(unsettledNodes);
      for (int i=unsettledNodes.size()-1;i>=0;i--) {
        if (unsettledNodes.get(i)==evaluationNode) unsettledNodes.remove(i);
      }
      settledNodes.add(evaluationNode);
      evaluatedNeighbors(evaluationNode);
    }
  }

  public void startOver() {
    for (Node n:nodes) {
        n.setFinalDistance(Integer.MAX_VALUE);
      
    }
  }
}


