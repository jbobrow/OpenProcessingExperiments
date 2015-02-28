
// PVector mouse accelerated tape drawer
// processing.org/learning/pvector/
// 08.05.2012 18:00
// put mouse anywhere over the script window and draw the fading tape

Mover mover; // declare Mover object

void setup () {
  size (300,300);
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
    topspeed = 5;
  }
  
  void update() {
    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location); // direction from point of appearance to mouse position
    dir.normalize(); // normalizing direction vector
    dir.mult(0.5); // multiplying normalized direction vector
    acceleration = dir; // acceleration
   
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    stroke(0.1,50);
    fill(0);
    line (location.x,location.y,mouseX,mouseY);
    
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
