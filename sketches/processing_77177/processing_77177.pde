
PFont f;

// Declare Mover object
Mover mover;

void setup() {
  size(800,600);
  smooth();
  background(50);
  f = createFont ("Verdana Bold", 16, true);
  // Make Mover object
  mover = new Mover(); 
}

void draw() {
  noStroke();
  fill(50,10);
  rect(0,0,width,height);
  textFont (f, 32);
  fill (128, 128, 255);
  text ("Kenny Rose Design", 440, 575);
  textFont (f, 16);
  fill (128, 128, 255);
  text ("created with Processing and Processing.js", 20, 20);
  // Call functions on Mover object.
  mover.update();
  mover.checkEdges();
  mover.display(); 
}

class Mover {

  // Our object has two PVectors: location and velocity
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 15;
  }

 void update() {

    PVector mouse = new PVector(mouseX,mouseY);
    // Step 1: direction
    PVector dir = PVector.sub(mouse,location);
    
    // Step 2: normalize
    dir.normalize();
    
    // Step 3: scale
    dir.mult(0.5);
    
    // Step 4: accelerate
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

  }

  void display() {
    stroke(255,235,215);
    fill(255,128,100);
    ellipse(location.x,location.y,25,25);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }

  }

}


