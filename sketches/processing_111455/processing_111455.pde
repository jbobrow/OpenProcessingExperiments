
Node[] nodes = new Node[10];

void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  smooth();
  for (int i = 0; i < nodes.length; i++) {
    nodes[i] = new Node(); 
  }
}

void draw() {
  fadeBackground(30);
  for (int i = 0; i < nodes.length; i++) {
    nodes[i].run();
  }
}

void fadeBackground(int a) {
  noStroke();
  fill(0, 0, 100, a);
  rect(0, 0, width, height);
}

class Node {
  
  PVector loc, vel, acc;
  float velLimit = 10;
  int hue;
  
  Node() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    hue = int(random(100));
  }
  
  void run() {
    move();
    display();
  }
  
  void move() {
    seekMouse();
    vel.add(acc);
    gravity();
    vel.limit(velLimit);
    bounce();
    loc.add(vel);
  }
  
  void seekMouse() {
    PVector mouse = new PVector(mouseX, mouseY);
    acc = PVector.sub(mouse, loc);
    acc.normalize();
    acc.mult(0.1);
  }
  
  void gravity() {
    vel.y += 0.1;
  }
  
  void bounce() {
    if (loc.x < 0 && vel.x < 0) vel.x *= -1;
    else if (loc.x > width && vel.x > 0) vel.x *= -1;
    if (loc.y < 0 && vel.y < 0) vel.y *= -1;
    else if (loc.y > height && vel.y > 0) vel.y *= -1;
  }
  
  void display() {
    noStroke();
    fill(hue, 100, 78);
    ellipse(loc.x, loc.y, 30, 30);
  }
  
}
    


