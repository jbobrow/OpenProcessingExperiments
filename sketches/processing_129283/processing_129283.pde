
Pea[] peas = new Pea[100];
public float maxMass = 0.1;
public float minMass = 0.001;
public float accMult = 0.35;
ArrayList nodes;
public float diameter = 50;
int defCount = int(diameter * 2);
public int countd, countu; // Count down and count up

void setup() {
  size(400, 400);
  smooth();
  background(255);
  for (int i = 0; i < peas.length; i++) {
    peas[i] = new Pea(random(width), random(-50, 50) + height * 0.5, random(minMass, maxMass));
  }
  nodes = new ArrayList();
  countd = int(diameter);
  countu = int(diameter);
}

void draw() {
  background(255);
  counter();
  
  // Work out acceleration
  for (int p = 0; p < peas.length; p++) {
    // Nodes
    for (int n = 0; n < nodes.size(); n++) {
      Node node = (Node) nodes.get(n);
      peas[p].seek(node.loc, node.mass);
    }
    // Peas
    for (int q = 0; q < peas.length; q++) {
      if (q != p) {
        peas[p].seek(peas[q].loc, peas[q].mass);
      }
    }
  }
  
  // Move and display
  for (int p = 0; p < peas.length; p++) {
    peas[p].move(nodes.size() + peas.length - 1);
    peas[p].display();
  }    
  for (int i = 0; i < nodes.size(); i++) {
    Node node = (Node) nodes.get(i);
    node.display();
  }
}

void counter() {
  countd--;
  if (countd < 0) countd = defCount;
  countu++;
  if (countu > defCount) countu = 0;
}

// Key events
void keyPressed() {
  if (key > 48 && key < 58) accMult = (key - 47) * 0.05;
  else if (key == '=' || key == '+') accMult += 0.1;
  else if (key == '-' || key == '_') {
    accMult -= 0.1;
    if (accMult < 0.0) accMult = 0;
  }
}


// Mouse events
void mouseClicked() {
  for (int i = 0; i < nodes.size(); i++) {
    Node node = (Node) nodes.get(i);
    if (node.isUnderMouse(mouseX, mouseY)) {
      nodes.remove(i);
      return;
    }
  }
  if (mouseButton == LEFT) nodes.add(new Node(mouseX, mouseY, 100.0));
  else nodes.add(new Node(mouseX, mouseY, -80.0));
}
class Node {
  
  PVector loc;
  float mass;
  float r, g, b, a;
  int count;
  
  Node(float _x, float _y, float _m) {
    loc = new PVector(_x, _y);
    mass = _m;
    if (mass > 0) r = 10;
    else r = 200;
    a = 200;
    count = defCount;
  }
  
  boolean isUnderMouse(float _x, float _y) {
    if (dist(_x, _y, loc.x, loc.y) <= diameter * 0.5) return true;
    else return false;
  }
  
  void display() {
    fill(r, a);
    noStroke();
    ellipse(loc.x, loc.y, diameter, diameter);
    wave();
  }
  
  void wave() {
    noStroke();
    if (mass > 0) {
      fill(0, 20);
      ellipse(loc.x, loc.y, countd, countd);
    }
    else {
      fill(0, 10);
      ellipse(loc.x, loc.y, countu, countu);
    }
  }
  
}
class Pea {
  
  PVector loc, ploc, pploc, vel, acc;
  float mass;
  float velLimit = 10;
  float r, g, b, a;
  
  Pea(float _x, float _y, float _m) {
    loc = new PVector(_x, _y);
    ploc = new PVector(_x, _y);
    pploc = new PVector(_x, _y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = _m;
    r = random(10, 100);
    a = 240;
  }
  
  void seek(PVector _n, float _m) {
    PVector n = PVector.sub(_n, loc);
    n.div(sq(0.01 * _n.dist(loc)));
    n.mult(_m);
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
  
  void display() {
    stroke(r, a);
    strokeWeight(map(mass, maxMass, minMass, 5, 0.1));
    line(loc.x, loc.y, pploc.x, pploc.y);
    wrap();
    line(loc.x, loc.y, pploc.x, pploc.y);
    pploc.set(ploc);
    ploc.set(loc);
  }
  
  void wrap() {
    if (loc.x > width) {
      loc.x -= width;
      ploc.x -= width;
      pploc.x -= width;
    }
    else if (loc.x < 0) {
      loc.x += width;
      ploc.x += width;
      pploc.x += width;
    }
    if (loc.y > height) {
      loc.y -= height;
      ploc.y -= height;
      pploc.y -= height;
    }
    else if (loc.y < 0) {
      loc.y += height;
      ploc.y += height;
      pploc.y += height;
    }
  }
}


