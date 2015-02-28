
ArrayList<Node> nodes;
float maxDistance = 60;
float dx = 40;
float dy = 40;
float maxNeighbors = 10;
 
Boolean drawMode = true;
 
void setup()
{
  size(600,400);
  background(0);
  nodes = new ArrayList<Node>();
}
 
void draw()
{
  background(0);
   
  if(drawMode)
  {
    if(mousePressed){
      addNewNode(mouseX,mouseY,random(-dx,dx),random(-dx,dx));
    }
  } else
  {
    addNewNode(random(width),random(height),0,0);
  }
   
 
   
  for(int i = 0; i < nodes.size(); i++){
    Node currentNode = nodes.get(i);
    for(int j=0; j<currentNode.neighbors.size(); j++)
    {
      Node neighborNode = currentNode.neighbors.get(j);
      float lineColor = currentNode.calculateLineColor(neighborNode,maxDistance);
      stroke(lineColor, lineColor, lineColor,lineColor/1.3);
      line(currentNode.x,currentNode.y,neighborNode.x,neighborNode.y);
    }
    currentNode.display();
  }
}
 
void addNewNode(float xPos, float yPos, float dx, float dy)
{
  //println("add new node");
  //generates a random location within a 50x50px box around the mouse
  //float xPos = mouseX + random(-50,50);
  //float yPos = mouseY + random(-50,50);
  //adds a node at this location
  Node node = new Node(xPos+dx,yPos+dy);
   
  node.setNumNeighbors( countNumNeighbors(node,maxDistance) );
   
  //println("newly added node has " + node.numNeighbors + " neighbors");
  //println("and neighbors.size() = " + node.neighbors.size());
   
  if(node.numNeighbors < maxNeighbors){
    nodes.add(node);
    for(int i=0; i<nodes.size(); i++)
    {
      Node currentNode = nodes.get(i);
      currentNode.setNumNeighbors( countNumNeighbors(currentNode,maxDistance) );
    }
  }
   
}
 
int countNumNeighbors(Node nodeA, float maxNeighborDistance)
{
  int numNeighbors = 0;
  nodeA.clearNeighbors();
   
  for(int i = 0; i < nodes.size(); i++)
  {
    Node nodeB = nodes.get(i);
    float distance = sqrt((nodeA.x-nodeB.x)*(nodeA.x-nodeB.x) + (nodeA.y-nodeB.y)*(nodeA.y-nodeB.y));
    if(distance < maxNeighborDistance)
    {
      numNeighbors++;
      nodeA.addNeighbor(nodeB);
    }
  }
  return numNeighbors;
}
 
void keyPressed()
{
  drawMode = !drawMode;
  nodes = new ArrayList<Node>();
}
class Node
{
  float x;
  float y;
  int numNeighbors;
  ArrayList<Node> neighbors;
  float lineColor;
  float nodeWidth = 3;
  float nodeHeight = 3;
  float fillColor = 50;
  float lineColorRange = 160;
   
   
 
  Node(float xPos, float yPos)
  {
    x = xPos;
    y = yPos;
    numNeighbors = 0;
    neighbors = new ArrayList<Node>();
  }
   
  void display()
  {
    noStroke();
    fill(fillColor);
    ellipse(x,y,nodeWidth,nodeHeight);
  }
   
  void addNeighbor(Node node)
  {
    neighbors.add(node);
  }
   
  void setNumNeighbors(int num)
  {
    numNeighbors = num;
  }
   
  void clearNeighbors()
  {
    neighbors = new ArrayList<Node>();
  }
   
  float calculateLineColor(Node neighborNode, float maxDistance)
  {
    float distance = sqrt((x-neighborNode.x)*(x-neighborNode.x) + (y-neighborNode.y)*(y-neighborNode.y));
    lineColor = (distance/maxDistance)*lineColorRange;
    return lineColor;
  }
     
}

