
class Node
{
  PVector pos;
  Node parent;
 
  Node(float x, float y) {
    pos = new PVector(x,y);
  }
  
  Node(Node base, Node sample) {
    PVector step = PVector.sub(sample.pos,base.pos);
    step.limit(5.0);
    pos = PVector.add(base.pos,step);
    parent = base;
  }
 
  float dist(Node other) {
    return PVector.dist(pos,other.pos);
  }
  
  // Draws a line between nearest node and new node
  void display() {
    if (parent!=null) {
      line(parent.pos.x, parent.pos.y, pos.x, pos.y);
    }
  }
}
// Credit goes to Alexander Mordvintsev for his code "Roots"
// which was inspired by RRT (Rapidly-exploring Random Trees)
// See here: http://www.openprocessing.org/sketch/38518

import processing.pdf.*;

ArrayList<Node> nodes;
int     branching    = 100;
float   branchLength = 5.0;
 
void setup()
{
  size(500,500);
  background(255);
  strokeWeight(1);
  smooth();
  nodes = new ArrayList();
  beginRecord(PDF, "cracks1.pdf");
}

void draw() {
  // Adds the parent node
  if (nodes.size() == 0)
    nodes.add(new Node(width-20,height/2));
  // Accelerates the amount of growth per frame
  for (int i=0; i<10; i++)
    grow();
}

void keyPressed() {
  endRecord();
  exit();
}

Node findNearest(Node p) {
  float minDist = 1e10;
  int minIndex  = -1;
  for (int i=0; i<nodes.size(); i++) {
    float d = p.dist(nodes.get(i));
    if (d<minDist) {
      minDist  = d;
      minIndex = i;
    }
  }
  return nodes.get(minIndex);
}
 
void grow() {
  float t = millis()/1000.0;
  // Circle... can be changed to Lissajous curves
  float px = map(cos(t),-1,1,0,width);
  float py = map(sin(t),-1,1,0,height);
  
  float x, y;
  // Makes sure new node is formed within the branching radius
  do {
    x = random(-1 * branching, branching);
    y = random(-1 * branching, branching);
  } while (sq(x) + sq(y) > sq(branching));
  x += px;
  y += py;
  
  // Boundaries for the frame of the lasercut
  if(x>20 && x<width-20 && y>20 && y<height-20) {
    Node sample = new Node(x, y);
    Node base = findNearest(sample);
    // Makes sure new node is at least branchLength away
    if (base.dist(sample) >= branchLength) {
      Node newNode = new Node(base, sample);
      nodes.add(newNode);
      newNode.display();
    }
  }
}


