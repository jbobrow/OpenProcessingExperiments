
// PVector accelerated mover algorythm
// processing.org/learning/pvector/
// 08.05.2012 12:00

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
    // algorythm : velocity change by acceleration and limited by topspeed
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
