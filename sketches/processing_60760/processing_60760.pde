
// PVector mover algorythm
// processing.org/learning/pvector/
// 08.05.2012 11:30
// reload script for change mover direction

// declare Mover object
Mover mover;

void setup () {
  size (200,200);
  smooth();
  background (255);
  
  // make Mover object
  mover = new Mover();
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
  
  // one PVector for location
  // one PVector for velocity
  PVector location;
  PVector velocity;
  
  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
  }
  
  void update() {
    // algorythm : locations change by velocity
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
