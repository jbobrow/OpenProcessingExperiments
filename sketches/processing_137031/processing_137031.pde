


void setup() {
  size(800, 500); 
  NODES = new ArrayList();
  for (int i = 0; i < numNodes; i++) {
    Node n = new Node(random(margin, width-margin), random(margin, height-margin));
    if(random(1) > 0.25){
     n.device = true; 
    }else{
     n.r *= 1.5;
    }
    NODES.add(n);
  }
  newNode = false;
  
  smooth();
}


void draw() { 
  background(0);
  
  if(newNode) {
    NODES.add(current);
    newNode = false;
  }
  
  for(int i = 0; i < NODES.size(); i++) {
    Node n = (Node)NODES.get(i);
    n.calc();
    n.renderLinks();
  }

  for(int i = 0; i < NODES.size(); i++) {
    Node n = (Node)NODES.get(i);
    n.calc();
    if(n.device) {
      n.renderDevice();
    }
    else {
      n.renderNode();
    }
  }
}


class Node {
  int id;           // the ID of this node
  float x, y;       // position
  float r;          // radius
  float signal;     // ammount of signal
  boolean on;       // is it on?
  boolean over;     // is the mouse over this one?
  ArrayList nodes;  // list of nodes that are connected to this one
  boolean device = false;
  float angle, step;

  Node(float X, float Y) {
    count++;
    id = count;
    x = X;
    y = Y;
    signal = 0;
    on = true;
    nodes = new ArrayList();
    r = 7.0;
    angle = random(TWO_PI);
    step = random(0.3, 2);
  }


  void renderNode() {
    if(over) {
      noFill();
      stroke(linkColor);
      strokeWeight(.50);
      ellipse(x,y, nodeScope, nodeScope);
      fill(nodeFillColor);
      stroke(nodeStrokeColor);
    }
    else {
      fill(nodeFillColor, 150);
      stroke(nodeStrokeColor, 50);
    }
    if(on) {
      strokeWeight(3);
    }
    else {
      strokeWeight(0.5);
    }
    ellipse(x,y, r, r);
  }

  void renderDevice(){
    move();
    if(over) {
      noFill();
      stroke(linkColor);
      strokeWeight(.5);
      ellipse(x,y, nodeScope, nodeScope);
      fill(deviceFillColor);
      stroke(deviceStrokeColor);
    }
    else {
      fill(deviceFillColor, 150);
      stroke(deviceStrokeColor, 150);
    }
    if(on) {
      strokeWeight(1);
    }
    else {
      noStroke();
    }
    ellipse(x,y, r, r);
  }

  void renderLinks() {
    if(on) {
      stroke(linkColor, 100);
      for(int i = 0; i < nodes.size(); i++) {
        Node n = (Node)nodes.get(i);
        float d = dist(x, y, n.x, n.y);
        float sw = map(d, r, nodeScope, 5, 0.1);
        sw = constrain(sw, 0.01, 20);
        strokeWeight(sw);
        line(x, y, n.x, n.y);
      }
    }
  }

  void calc() {
    nodes.clear();
    for(int i = 0; i < NODES.size(); i++) {
      Node n = (Node)NODES.get(i);
      if(id != n.id) {
        float nodeDist = dist(x, y, n.x, n.y);
        if(nodeDist <= nodeScope && n.on) {
          nodes.add(n);
        }
      }
    }
  }
  
  void move(){
    noiseSeed(id);
    angle += (noise((float)millis()/100.0) - .5) * HALF_PI;
    
    x += cos(angle)*step;
    y += sin(angle)*step;
    
  }
}

boolean OVER;
ArrayList NODES;
int numNodes = 126;
int count = 0;
float margin = 100;
float nodeScope = 80;
boolean newNode;
Node current;

color nodeFillColor = color(13, 184, 250);
color nodeStrokeColor = color(15, 111, 188);
color linkColor = color(165, 218, 237); 
color deviceFillColor = color(255, 103, 8);
color deviceStrokeColor = color(201, 81, 6);


void keyPressed() {
  if(key == 'a') {
    nodeScope += 5;
    println("node scope = "+nodeScope);
  } 
  if(key == 'z') {
    nodeScope -= 5;
    println("node scope = "+nodeScope);
  } 
  if(key == ' ') {
    for(int i = 0; i < NODES.size(); i++) {
      Node n = (Node)NODES.get(i);
      n.on = !n.on;
    }
  }
  if(key == 'x') {
    setup();
  }
  nodeScope = constrain(nodeScope, 5, width);
}


void mouseMoved() {
  float d;
  for(int i = 0; i < NODES.size(); i++) {
    Node n = (Node)NODES.get(i);
    d = dist(mouseX, mouseY, n.x, n.y);
    if(n.r*1.5 >= d) {
      OVER = true;
      n.over = true;
      current = n;
    }
    else {
      OVER = false;
      n.over = false;
    }
  }
}

void mouseDragged() {
  if(OVER) {
    if(current.over) {
      current.x = mouseX;
      current.y = mouseY;
    }
  }
}

void mouseReleased() {
  if(current.over && mouseButton==RIGHT) {
    current.on = !current.on;
  }
}

/*
void mousePressed(){
 if(!newNode && !current.over && mouseButton==LEFT){
 current = new Node(mouseX, mouseY);
 OVER = false;
 newNode = true;
 }
 }*/


