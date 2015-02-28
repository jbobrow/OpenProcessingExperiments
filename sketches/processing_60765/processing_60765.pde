
// PVector accelerated mover algorythm
// worms accelerated
// processing.org/learning/pvector/
// 08.05.2012 12:10

Mover mover; // declare Mover object

void setup () {
  size (200,200);
  smooth();
  background (255);
  
  mover = new Mover(); // make Mover object
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  // call functions on Mover object
  mover.update();
  mover.checkEdges();
  mover.display();
}

class Mover {
   
  PVector location; // one PVector for location
  PVector velocity; // one PVector for velocity
  PVector acceleration; // acceleration added
  float topspeed; // limits velocity magnitude
  
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001,0.01);
    topspeed = 10;
  }
  
  void update() {
    
    acceleration = new PVector(random(-1,1), random(-1,1));
    acceleration.normalize();
    // acceleration.mult(0.5); // scaling the acceleration to constant
    acceleration.mult(random(2)); // random scaled acceleration
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    stroke(0);
    fill(0);
    ellipse(location.x,location.y,16,16);
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
