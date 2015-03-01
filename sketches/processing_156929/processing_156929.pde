
//Day48 #create365

ArrayList<Particle> particlesT;
ArrayList<Particle> particlesB;

int numLines = 100;
PVector mouse;
int d = 1;

int angStart = 0;
float angInc = PI/numLines;
int r = 250;
int sep = 50;

void setup() {
  size(600, 600);
  background(0);
  smooth();
  

  particlesT = new ArrayList<Particle>();
  particlesB = new ArrayList<Particle>();
  
  for (int i = 0; i < 2*numLines; i++) {
    float angle = angStart + angInc*i ;
    particlesT.add(new Particle(new PVector((r-sep)*cos(angle), (r-sep)*sin(angle))));
    particlesB.add(new Particle(new PVector((r-sep)*cos(angle + PI), (r-sep)*sin(angle + PI))));
  }
 
}


void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  mouse = new PVector(mouseX - width/2, mouseY - height/2);

  if (mousePressed) {
    d = -1;
  } else {
    d = 1;
  }


  for (Particle p : particlesT) {
    PVector force = p.calcForce(mouse, d);
    p.applyForce(force);
    p.update();
  }

  for (Particle p : particlesB) {
    PVector force = p.calcForce(mouse, d);
    p.applyForce(force);
    p.update();
  }
  noFill();
  strokeWeight(2);
  for (int i = 0; i < numLines; i++) {
    Particle pT = particlesT.get(i);
    Particle pB = particlesB.get(i);
    float angle = angStart + angInc*i;
    stroke(255 - i, 150 - i, 10, 70);
    bezier(r*cos(angle), r*sin(angle), pT.location.x, pT.location.y, pB.location.x, pB.location.y, r*cos(angle + PI), r*sin(angle + PI));
  }
  popMatrix();
  
}

class Particle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float strength;

  Particle(PVector loc) {
    location = loc.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    strength = 0.1;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(10);
    velocity.mult(0.997);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    fill(200);
    ellipse(location.x, location.y, 20, 20);
  }

  PVector calcForce(PVector mouse_, int dir) {
    PVector mouse = mouse_.get();
    PVector force = PVector.sub(mouse, location);
    float distance = force.mag();
    distance = constrain(distance, 5, 40);
    force.normalize();
    force.mult(strength);
    force.mult(dir);

    return force;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }
}




