
Mover[] mover = new Mover[200];

void setup() {
  size(800, 800);


  for (int i= 0; i < mover.length; i++) {
    mover[i] = new Mover();
  }
}

void draw() {
  background(32);
  noStroke();
  smooth();
  for (int i = 0; i < mover.length; i++) {
    mover[i].update();
    mover[i].display();
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  PVector dir;
  float ballSize;
  float topSpeed;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,0);
    mouse = new PVector();
    dir = new PVector();
    ballSize = random(14);
    topSpeed = random(8);
  }

  void update() {
    mouse.set(mouseX,mouseY,0);
    dir = PVector.sub(mouse, location);
    dir.normalize();     // Normalize
    dir.mult(0.5);       // Scale 
    acceleration = dir;  // Set to acceleration
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    //velocity.add(dir);
    
    
  }

  void display () {
    fill(255,32,32);
    ellipse(location.x, location.y, ballSize, ballSize);
  }
}



