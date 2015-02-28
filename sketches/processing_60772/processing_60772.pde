
// PVector accelerated mover algorythm
// worms array accelerated by mouse
// processing.org/learning/pvector/
// 08.05.2012 13:00

// put mouse anywhere over script window

Mover[] movers = new Mover[20]; // array of objects

void setup () {
  size (200,200);
  smooth();
  background (255);
  // init all array elements
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}
 
void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  // call functions of all array elements
  for (int i = 0; i < movers.length; i++) {
  movers[i].update();
  movers[i].checkEdges();
  movers[i].display();
 }
}

class Mover {
   
  PVector location; // one PVector for location
  PVector velocity; // one PVector for velocity
  PVector acceleration; // acceleration added
  float topspeed; // limits velocity magnitude
  
  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    // acceleration = new PVector(-0.001,0.01);
    topspeed = 4;
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
