
Mover[] movers = new Mover[20];
 
void setup() {
  size(640,360);
  background(0);
  for (int i = 0; i < movers.length; i++) {
//Initialize each object in the array.
    movers[i] = new Mover();
  }
}
 
void draw() {
  background(0);
 
  for (int i = 0; i < movers.length; i++) {
//Calling functions on all the objects in the array
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}
 
class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
 
  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }
 
  void update() {
 
//Our algorithm for calculating acceleration:
 
//Find the vector pointing towards the mouse.
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
//Normalize.
    dir.normalize();
//Scale.
    dir.mult(0.01);
//Set to acceleration.
    acceleration = dir;
 
//Motion 101! Velocity changes by acceleration. Location changes by velocity.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
 
//Display the Mover
  void display() {
    stroke(255,255,0);
    fill(255);
    ellipse(location.x,location.y,64,64);
  }
 
//What to do at the edges
  void checkEdges() {
 
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
  }
}


//Source : The Nature Of Code by Daniel Shiffman Chapton 1 = Vectors
