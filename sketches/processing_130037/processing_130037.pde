
ArrayList<MovingNode> nodes;
float maxDistance = 65;
float dx = 30;
float dy = 30;
float maxNeighbors = 10;

Boolean drawMode = false;

float emitterX = width/2;
float emitterY = height/2;
float emitterXVel = 0;
float emitterYVel = 0;
float emitterXAccel = 0;
float emitterYAccel = 0;

float accelValue = 0.5;

void setup()
{
  size(800,600);
  //background(220);
  background(220, 110, 30);
  nodes = new ArrayList<MovingNode>();
}

void draw()
{
  //println(nodes.size());
  
  //background(220);
    background(220, 110, 30);
  
  if(drawMode)
  {
    if(mousePressed){
      addNewNode(mouseX,mouseY,random(-dx,dx),random(-dy,dy));
    }
  } else
  {
    emitterXAccel = random(-accelValue,accelValue);
    emitterYAccel = random(-accelValue,accelValue);
  
    emitterXVel += emitterXAccel;
    emitterYVel += emitterYAccel;
    
    if(emitterX < 0)
    {
      emitterX = 0;
      emitterXVel *= -1;
    
    } else if(emitterX > width)
    {
      emitterX = width;
      emitterXVel *= -1;
    }
    
    if(emitterY < 0)
    {
      emitterY = 0;
      emitterYVel *= -1;
    
    } else if(emitterY > height)
    {
      emitterY = height;
      emitterYVel *= -1;
    }
    
    emitterX += emitterXVel;
    emitterY += emitterYVel;
  
  
    //addNewNode(random(width),random(height),0,0);
    addNewNode(emitterX, emitterY, random(-dx,dx), random(-dy,dy));
    addNewNode(width - emitterX, emitterY, random(-dx,dx), random(-dy,dy));
    addNewNode(width - emitterX, height - emitterY, random(-dx,dx), random(-dy,dy));
    addNewNode(emitterX, height - emitterY, random(-dx,dx), random(-dy,dy));

  }
  
  for(int i=0; i<nodes.size(); i++)
  {
    MovingNode currentNode = nodes.get(i);
    currentNode.setNumNeighbors( countNumNeighbors(currentNode,maxDistance) );
  }
  
  /*for(int i=0; i<nodes.size(); i++)
  {
    MovingNode currentNode = nodes.get(i);
    if(currentNode.x > width || currentNode.x < 0 || currentNode.y > height || currentNode.y < 0)
    {
      nodes.remove(currentNode);
    }
  }*/
  
  for(int i = 0; i < nodes.size(); i++){
    MovingNode currentNode = nodes.get(i);
    for(int j=0; j<currentNode.neighbors.size(); j++)
    {
      MovingNode neighborNode = currentNode.neighbors.get(j);
      float lineColor = currentNode.calculateLineColor(neighborNode,maxDistance);
      stroke(lineColor, lineColor, lineColor);
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
  MovingNode node = new MovingNode(xPos+dx,yPos+dy);
  
  node.setNumNeighbors( countNumNeighbors(node,maxDistance) );
  
  //println("newly added node has " + node.numNeighbors + " neighbors");
  //println("and neighbors.size() = " + node.neighbors.size());
  
  
  if(node.numNeighbors < maxNeighbors){
    nodes.add(node);
    /*for(int i=0; i<nodes.size(); i++)
    {
      MovingNode currentNode = nodes.get(i);
      currentNode.setNumNeighbors( countNumNeighbors(currentNode,maxDistance) );
    }*/
  }
  
  
}

int countNumNeighbors(MovingNode nodeA, float maxNeighborDistance)
{
  int numNeighbors = 0;
  nodeA.clearNeighbors();
  
  for(int i = 0; i < nodes.size(); i++)
  {
    MovingNode nodeB = nodes.get(i);
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
  nodes = new ArrayList<MovingNode>();
}
class MovingNode
{
  float x;
  float y;
  int numNeighbors;
  ArrayList<MovingNode> neighbors;
  float lineColor;
  float nodeWidth = 3;
  float nodeHeight = 3;
  float fillColor = 255;
  float lineColorRange = 180;
  
  int lifetime = 100;
  
  float xVel=0;
  float yVel=0;
  float xAccel=0;
  float yAccel=0;
  
  float accelValue = 0.5;

  MovingNode(float xPos, float yPos)
  {
    x = xPos;
    y = yPos;
    numNeighbors = 0;
    neighbors = new ArrayList<MovingNode>();
  }
  
  void display()
  {
    move();
    
    noStroke();
    fill(fillColor);
    ellipse(x,y,nodeWidth,nodeHeight);
  }
  
  void move()
  {
    xAccel = random(-accelValue,accelValue);
    yAccel = random(-accelValue,accelValue);
    
    xVel += xAccel;
    yVel += yAccel;
    
    if(x < 0)
    {
      x = 0;
      xVel *= -1;
    
    } else if(x > width)
    {
      x = width;
      xVel *= -1;
    }
    
    if(y < 0)
    {
      y = 0;
      yVel *= -1;
    
    } else if(y > height)
    {
      y = height;
      yVel *= -1;
    }
    
    x += xVel;
    y += yVel;
    
    lifetime--;
    if (lifetime == 0)
    {
      nodes.remove(this);
    }
  }
  
  void addNeighbor(MovingNode node)
  {
    neighbors.add(node);
  }
  
  void setNumNeighbors(int num)
  {
    numNeighbors = num;
  }
  
  void clearNeighbors()
  {
    neighbors = new ArrayList<MovingNode>();
  }
  
  float calculateLineColor(Node neighborNode, float maxDistance)
  {
    float distance = sqrt((x-neighborNode.x)*(x-neighborNode.x) + (y-neighborNode.y)*(y-neighborNode.y));
    lineColor = (distance/maxDistance)*lineColorRange;
    return 255; //(127 + (255 - lineColor));
  }
    
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
    return 255; //(127 + (255 - lineColor));
  }
    
}
