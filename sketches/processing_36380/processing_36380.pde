
Mover[] movers = new Mover[1000];

void setup() {
  size(700,400);
  smooth();
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
}

void draw() {
  noStroke();
  fill(255,100);
  rect(0,0,width,height);
  

  for (int i = 0; i < movers.length; i++) {
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
  int Red = 0;
  int Green = 0;
  int Blue = 0;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }

  void update() {

    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);  
    dir.normalize();     
    dir.mult(0.05);      
    acceleration = dir;  

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  void display() {
 Red = (50);
 Blue = (50);
 Green = (50);
 stroke(255,0,0);
    fill(Red,Green,Blue);
    ellipse(location.x,location.y,8,8);
  }



  void checkEdges() {


  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;

  }

  }}


