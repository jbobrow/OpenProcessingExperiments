
Pea[] peas = new Pea[750];
ArrayList nodes;
boolean isFading = true;

void setup() {
  size(500, 500);
  smooth();
  background(255);
  for (int i = 0; i < peas.length; i++) {
    peas[i] = new Pea();
  }
  nodes = new ArrayList();
}

void draw() {
  if (isFading) fade();
  else background(255);
  for (int p = 0; p < peas.length; p++) {
    for (int n = 0; n < nodes.size(); n++) {
      Node node = (Node) nodes.get(n);
      peas[p].seek(node.pos());
    }
    if (nodes.size() > 0) {
      peas[p].move(nodes.size());
    }
    peas[p].display();
  }
  for (int i = 0; i < nodes.size(); i++) {
    Node node = (Node) nodes.get(i);
    node.display();
  }
}

void mouseClicked() {
  for (int i = 0; i < nodes.size(); i++) {
    Node node = (Node) nodes.get(i);
    if (node.isDeleted(mouseX, mouseY)) {
      nodes.remove(i);
      return;
    }
  }
  nodes.add(new Node(mouseX, mouseY)); 
}

// Toggle fading with space key
// Change rate of acceleration with number keys
void keyPressed() {
  if (key == ' ') isFading = !isFading;
  else if (key > 48 && key < 58) {
    for (int p = 0; p < peas.length; p++) {
      peas[p].accMultEquals((key - 47) * 0.5);
    }
  }
  //else saveFrame("frame_####.png");
}

void fade() {
  noStroke();
  fill(255, 20);
  rect(0, 0, width, height);
}
class Node {
  
  PVector loc;
  float r, g, b, a;
  
  Node(float _x, float _y) {
    loc = new PVector(_x, _y);
    r = random(50, 150);
    g = random(0, 100);
    b = random(100, 250);
    a = 100;
  }
  
  PVector pos() {
    return loc;
  }
  
  boolean isDeleted(float _x, float _y) {
    if (dist(_x, _y, loc.x, loc.y) <= 10) return true;
    else return false;
  }
  
  void display() {
    fill(r, g, b, a);
    noStroke();
    ellipse(loc.x, loc.y, 20, 20);
  }
  
}
class Pea {
  
  PVector loc, ploc, vel, acc;
  float accMult = 0.1;
  float velLimit = 10;
  float r, g, b, a;
  boolean isGravity = false;
  
  Pea() {
    loc = new PVector(random(width), random(height));
    ploc = new PVector(loc.x, loc.y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    r = random(100, 250);
    g = random(50, 150);
    b = random(0, 100);
    a = 255;
  }
  
  void seek(PVector _n) {
    PVector n = PVector.sub(_n, loc);
    acc = PVector.add(n, acc);
  }
  
  void move(float _i) {
    acc.div(_i);
    acc.normalize();
    acc.mult(accMult);
    vel.add(acc);
    vel.limit(velLimit);
    loc.add(vel);
  }
  
  void accMultEquals(float _m) {
    accMult = _m * 0.1;
  }
  
  void display() {
    stroke(r, g, b, a);
    strokeWeight(3);
    line(loc.x, loc.y, ploc.x, ploc.y);
    ploc.set(loc);
  }
  
}


