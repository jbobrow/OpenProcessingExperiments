
ArrayList<Particle> particlesT;
ArrayList<Particle> particlesB;
PVector mouse;
PVector f;

float x, y; 

int numLines = 26;

int radius = 200;

int xStart = 50;
int sep = 20 ;
int top = 50;

float mag = 0.01;

void setup() {
  size(600, 600);
  background(0);
  smooth();
  
  particlesT = new ArrayList<Particle>();
  particlesB = new ArrayList<Particle>();
  
  for (int i = 0; i < numLines; i++) {
    particlesT.add(new Particle(new PVector(xStart + sep*i, height/2 - top)));
    particlesB.add(new Particle(new PVector(xStart + sep*i, height/2 + top)));
}
}


void draw() {

  background(0);
  noFill();
  stroke(10, 170, 250, 200);
  strokeWeight(2);
  
  mouse = new PVector(mouseX-width/2, mouseY-height/2);
  mouse.normalize();
  f = PVector.mult(mouse,mag);
  
  for (Particle p : particlesT) {
    p.update();
    p.applyForce(f);
  }
  
  for (Particle p : particlesB) {
    p.update();
    p.applyForce(f);
  }
  noFill();
  for (int i = 0; i < numLines; i++) {
    Particle pT = particlesT.get(i);
    Particle pB = particlesB.get(i);
  bezier(xStart + sep*i, top, pT.location.x, pT.location.y, pB.location.x, pB.location.y, xStart + sep*i, height-top);
  bezier( top,xStart + sep*i, pT.location.y,pT.location.x, pB.location.y, pB.location.x, height-top, xStart + sep*i);
  }
 

}


class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Particle(PVector loc) {
    location = loc.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    fill(200);
    ellipse(location.x, location.y, 20, 20);
  }
}

