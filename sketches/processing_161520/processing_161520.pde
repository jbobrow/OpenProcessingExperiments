
// NO ES DE MI AUTORIA, SE MODIFICA CON FINES EDUCATIVOS PARA LA MAESTRÍA EN EDUCACIÓN
/* Tomado de: OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/99816*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

Node a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11;
Edge e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15, e16, e17, e18, e19, e20, e21, e22;
ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Edge> edges=new ArrayList<Edge>();
Dijkstra d;
int punto_inicio;
int punto_final; 
int stage;

void setup() {
  punto_inicio=0;
  punto_final=10;
  
  size(1000, 500);
  a1=new Node(20, 250, 0);
  a2=new Node(200, 50, 1);
  a3=new Node(400, 50, 2);
  a4=new Node(600, 50, 3);
  a5=new Node(200, 250, 4);
  a6=new Node(400, 250, 5);
  a7=new Node(600, 250, 6);
  a8=new Node(200, 450, 7);
  a9=new Node(400, 450, 8);
  a10=new Node(600, 450, 9);
  a11=new Node(780, 250, 10);
  e1=new Edge(a1, a2, 3);
  e2=new Edge(a1, a5, 5);
  e3=new Edge(a1, a8, 4);
  e4=new Edge(a2, a5, 5);
  e5=new Edge(a5, a8, 7);
  e6=new Edge(a2, a3, 2);
  e7=new Edge(a2, a6, 7);
  e8=new Edge(a5, a6, 4);
  e9=new Edge(a8, a6, 5);
  e10=new Edge(a8, a9, 2);
  e11=new Edge(a3, a6, 2);
  e12=new Edge(a6, a9, 4);
  e13=new Edge(a3, a4, 3);
  e14=new Edge(a3, a7, 6);
  e15=new Edge(a6, a7, 4);
  e16=new Edge(a6, a10, 3);
  e17=new Edge(a9, a10, 6);
  e18=new Edge(a4, a7, 7);
  e19=new Edge(a7, a10, 4);
  e20=new Edge(a4, a11, 2);
  e21=new Edge(a7, a11, 6);
  e22=new Edge(a10, a11, 5);
  
  
  
  
  nodes.add(a1);
  nodes.add(a2);
  nodes.add(a3);
  nodes.add(a4);
  nodes.add(a5);
  nodes.add(a6);
  nodes.add(a7);
  nodes.add(a8);
  nodes.add(a9);
  nodes.add(a10);
  nodes.add(a11);
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
  edges.add(e12);
  edges.add(e13);
  edges.add(e14);
  edges.add(e15);
  edges.add(e16);
  edges.add(e17);
  edges.add(e18);
  edges.add(e19);
  edges.add(e20);
  edges.add(e21);
  edges.add(e22);
  
  
}

void draw() {
  if(stage==0){
    stage++;    
    d=new Dijkstra(nodes, edges, punto_inicio,punto_final);
    d.dijkstra();
    d.render();
  }  for (Edge d: edges) {
    d.render();
  }
  for (Node n : nodes) {
    n.render();
  }
}



public class Dijkstra {
  ArrayList<Node> nodes;
  ArrayList<Edge> edges;
  ArrayList<Node> settledNodes=new ArrayList<Node>();
  ArrayList<Node> unsettledNodes=new ArrayList<Node>();
  Node start;
  Node end;
  int s,e;

  public Dijkstra(ArrayList<Node> nodes, ArrayList<Edge> edges, int s, int e) {
    this.nodes=nodes; 
    this.edges=edges;
    this.s=s;this.e=e;
    start=nodes.get(s);
    end=nodes.get(e);
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
    for(Node n: nodes){
      if(n==start||n==end){
        n.setCheck();
      }
    }
    Node vertex=end.shortestDistanceNode();
    traceBack(end,start);
    
  }
  
  public void startOver(){
    for(Node n:nodes){
      n.setFinalDistance(Integer.MAX_VALUE);
    }
    for(Edge e:edges){
      e.edgeColor=false;
    }
  }
  public void traceBack(Node end,Node start){
    Node vertex=end;
    while(vertex.getDistance()!=0){
      vertex=vertex.shortestDistanceNode();
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
  //get the shortest distanced node that is connected to this node
  //also change the color of the edge between these two nodes.
  public Node shortestDistanceNode(){
    int shortestDistance=Integer.MAX_VALUE;
    Node shortestNode=null;
    for(Edge e:connectedEdges){
      if(e.getPreviousNode(this).getDistance()<shortestDistance&&e.getPreviousNode(this).getDistance()==this.getDistance()-this.getConnectedEdge(e.getPreviousNode(this)).getWeight()){
        shortestNode=e.getPreviousNode(this);
      }
    }
    shortestNode.getConnectedEdge(this).edgeColor=true;
    return shortestNode;
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
  //returns all the nodes connected to this node;
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
  public boolean shouldColor(){
    for(Edge e:connectedEdges){
      if(e.edgeColor==true){
        return true;
      }
    }
    return false;
  }


  public void render() {
    if (shouldColor()==true) {
      fill(#A231DB);
      ellipse(x, y, 40, 40);
      textSize(30);
      fill(255);
      text(""+s, x-9, y+10);
      textSize(20);
      fill(0);
      text("Shortest Distance: "+distance ,x+30,y+25);
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



