
Node a1, a2, a3, a4, a5, a6, a7;
Edge e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11;
ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Edge> edges=new ArrayList<Edge>();
Dijkstra d;
int one;
int two; 
int stage;
boolean help;
PImage img;


void setup() {
  img=loadImage("dijkstraAlgorithm.jpg");
  one=-1;
  two=-1;

  size(800, 500);
  background(#FADC88);
  smooth();
  a1=new Node(20, 40, 111);
  a2=new Node(500, 100, 1112);

  e1=new Edge(a1, a2, 4);

  creater();

}



void keyPressed()
{

  
  if ((key=='0'||key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9')&&stage;==0) {
    one=key-48;
  }
  else if ((key=='0'||key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9')&&stage;==1) {

    two=key-48;
  }

  if (key=='c') {
    stage=0;
    one=-1;
    two=-1;
    d=new Dijkstra(nodes, edges, 0, 5);

    background(#FADC88);
    d.startOver();
  }
  if(key=='a'){
    stage=0;
    one=-1;
    two=-1;
    d=new Dijkstra(nodes, edges, 0, 5);

    background(#FADC88);
    destroyer();
    creater();
  }
  if(key=='e'){
    eulerian();
  }
  if(key=='d'){
   
  help=true;
    
   
  }
}
void keyReleased(){
  if(help==true){
    help=false;
     background(#FADC88);
    
  }
}
void draw() {
  if(help==true){
   
    img.resize(800, 500);
  image(img, 0, 0);
  }
 
  if(stage==0&&one;==-1){
   textSize(30);
   stroke(0);
   text("Enter starting node:", 500,45);
   }else if(stage==0){
   stage++;
   }else if(stage==1&&two;==-1){
   background(#FADC88);
   textSize(30);
   stroke(0);
   text("Enter ending node:", 500,45);
   }else if(stage==1&one;!=two){
   stage++;
   background(#FADC88);
   d=new Dijkstra(nodes, edges, one,two);
   d.dijkstra();
   d.render();
   textSize(30);
   stroke(0);
   text("Shortest Distance From Node "+one+" to Node "+ two+" = "+nodes.get(two).getDistance(),50,45);
   }
   if(help==false){
  for (Edge d: edges) {
    d.render();
  }
  for (Node n : nodes) {
    n.render();
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
  public Node shortestDistanceNode() {
    int shortestDistance=Integer.MAX_VALUE;
    Node shortestNode=null;
    for (Edge e:connectedEdges) {
      if (e.getPreviousNode(this).getDistance()<shortestDistance&&e.getPreviousNode(this).getDistance()==this.getDistance()-this.getConnectedEdge(e.getPreviousNode(this)).getWeight()) {
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
  public boolean shouldColor() {
    for (Edge e:connectedEdges) {
      if (e.edgeColor==true) {
        return true;
      }
    }
    return false;
  }


  public void render() {
    if (shouldColor()==true) {
      fill(#3BD8D4);
      ellipse(x, y, 25, 25);
      textSize(18);
      fill(0);
      text(""+s, x-5, y+5);
      textSize(20);
      fill(0);
      text("Shortest Distance: "+distance, x+30, y+25);
    }
    else {
      fill(0, 255, 0);
      ellipse(x, y, 25, 25);
      textSize(18);
      fill(0);
      text(""+s, x-5, y+5);
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
      textSize(15);
      text(""+weight, midPoint.x-4, midPoint.y+3);
    }
    else {
      stroke(#07F524);
      line(a.x, a.y, b.x, b.y);
      fill(255, 0, 0);
      textSize(15);
      text(""+weight, midPoint.x-4, midPoint.y+5);
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
  int s, e;

  public Dijkstra(ArrayList<Node> nodes, ArrayList<Edge> edges, int s, int e) {
    this.nodes=nodes; 
    this.edges=edges;
    this.s=s;
    this.e=e;
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
    for (Node n: nodes) {
      if (n==start||n==end) {
        n.setCheck();
      }
    }
    Node vertex=end.shortestDistanceNode();
    traceBack(end, start);
  }

  public void startOver() {
    for (Node n:nodes) {
      n.setFinalDistance(Integer.MAX_VALUE);
    }
    for (Edge e:edges) {
      e.edgeColor=false;
    }
  }
  public void traceBack(Node end, Node start) {
    Node vertex=end;
    while (vertex.getDistance ()!=0) {
      vertex=vertex.shortestDistanceNode();
    }
  }
  
}
void creater(){
      int i=0;
  while (i<10) {
    int x=(int)(Math.random()*730+30);
    int y=(int)(Math.random()*400+75);
    Node n=new Node(x, y, i);
   
    int b=0;
    // if node n is not far away from all the other nodes , then don't add it in to the arraylist nodes.
    for (int a=0;a<nodes.size();a++) {
      //float distance=dist(n.x, nodes.get(a).x, n.y, nodes.get(a).y);
      float distance=sqrt(pow((n.x-nodes.get(a).x),2)+pow((n.y-nodes.get(a).y),2));
      println(a);
     
      println(distance);
   
      if (distance>80) {
        b++;
      }
    }
    
    if (b==nodes.size()) {
      nodes.add(n);
      i++;
    }
    else {
    }
  }
  
  for(int j=0;j<nodes.size();j++){
    for(int e=0;e<2;e++){
      int random=(int)(Math.random()*nodes.size());
      Edge theEdge=new Edge(nodes.get(random) ,nodes.get(j) ,(int)(Math.random()*10+1));
     
      edges.add(theEdge);
        
      
      }
  
  }
}
void destroyer(){
  while(nodes.size()!=0){
    nodes.remove(0);
  }
  while(edges.size()!=0){
    edges.remove(0);
  }
}
void eulerian(){
  int numNodes=nodes.size();
  int eulerian=0;
  int semiEulerian=0;
  for(Node n:nodes){
    if(n.getEdge().size()==2){
      eulerian++;
    }
    if(n.getEdge().size()%2!=0){
      semiEulerian++;
    }
  }

  if(numNodes==eulerian){
    background(#FADC88);
     textSize(30);
     stroke(0);
     text("Eulerian Circuits",300,700);
  }else if(semiEulerian==2){
    background(#FADC88);
    textSize(30);
     stroke(0);
     text("Semi-Eulerian",300,700);
  }else if(semiEulerian==1){
    background(#FADC88);
    textSize(30);
     stroke(0);
     text("Eulerian Path",300,700);
     
  }else {
    background(#FADC88);
    textSize(30);
     stroke(0);
     text("NonEulerian Path",300,700);
  }
}
