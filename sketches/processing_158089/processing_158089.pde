
Mover[] movers = new Mover[300];

PVector center;
boolean showTriangles = true;

void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  textSize(10);
  textAlign(LEFT, CENTER);
  
  center = new PVector(width/2, height/2);

  for (int i = 0; i < movers.length; i ++ ) {
    movers[i] = new Mover(random(width/4, 3*width/4), random(height/4, 3*width/4), 0.5);
  }
  
}

PVector mouse = new PVector();

void draw() {

  distC-=0.5f;
  mouse.set(mouseX, mouseY);

  for (int i = 0; i < movers.length; i ++ ) {
    movers[i].applyForce(gravity(movers[i]));
  }

  background(0);
  stroke(255);
  
  for (int i = 0; i < movers.length; i ++ ) {
    movers[i].display();
  }
  
  if (showTriangles) {
    beginShape(TRIANGLES);
    for (int i = 0; i < movers.length; i ++ ) {
      Mover m = movers[i];
      fill(m.c);
      vertex(m.pos.x, m.pos.y);
    }
    endShape(CLOSE);
  }
}

float distC = 1;

PVector gravity(Mover mov) {
  PVector force = PVector.sub(center, mov.pos);
  float distance = force.mag();
  if (distC <= 0.1f) distC = 35;
  distance = constrain(distance, distC, distC);
  float m = (mov.mass) / (distance* distance);
  force.normalize();
  force.mult(m);
  return force;
}

void keyPressed() {
  if (key == '=') {
    distC++;
  } else if (key== '-') {
    distC--;
  } else if (key == 'r') {
    for (int i = 0; i < movers.length; i ++ ) {
      Mover m = movers[i];
      m.velocity.mult(0);
      m.acceleration.mult(0);
      m.pos.set(random(width/4, 3*width/4), random(height/4, 3*width/4));
    }
  } else if (key == 's') {
    showTriangles = !showTriangles;

  }
}

void mouseWheel(MouseEvent e) {
  distC+=e.getAmount()*0.1f;
}

class Mover {
  PVector pos;
  PVector velocity;
  PVector acceleration;
  float mass;
  float size;
  int c;

  Mover(float x_, float y_, float m) {
    pos = new PVector(x_, y_);
    velocity = new PVector();
    acceleration = new PVector();
    mass = m;
    size = 2;
    c = color(random(0, 360), 70, 90, 60);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  } 

  void update() {
    velocity.add(acceleration);
    pos.add(velocity);
    acceleration.mult(0);
  }

  void display() {

    update();
    checkBorders();

    pushStyle();
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, size, size);
    popStyle();
  }

  void checkBorders() {
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }
}

