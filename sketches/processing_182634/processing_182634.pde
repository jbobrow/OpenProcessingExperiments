
class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 5;
  }
  
  void update() {
    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);
    acceleration.normalize();
    acceleration.mult(0.2);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    
    //superpig body
    stroke(0);
    fill(245,195,233);
    ellipse(location.x,location.y,100,75);
    
    //superpig head
    stroke(0);
    fill(245,195,233);
    ellipse(location.x-50,location.y-40,50,50);
    
    //superpig eyes
    //eye color linked to mouse location
    fill(mouseX,0,mouseY);
    ellipse(location.x-60,location.y-45,10,10);
    
    //superpig snout
    stroke(0);
    fill(252,171,234);
    ellipse(location.x-75,location.y-35,15,20);
    
    //superhog ear
    triangle(location.x-55,location.y-75,location.x-60,location.y-60,location.x-30,location.y-60);
    
    //superhog legs
    stroke(0);
    //legs drawn according to the mouse location and previous mouse location
    line(location.x-25,location.y+25,location.x-25,location.y+60);
    line(location.x+25,location.y+25,location.x+25,location.y+60);
  }
  
}
Mover[] movers = new Mover [20];

void setup() {
  size(500,500);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  
  background(26,142,131);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display();
  }
}


