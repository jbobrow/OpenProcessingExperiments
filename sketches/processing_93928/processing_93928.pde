
Mover[] movers = new Mover[1000];

void setup() {
  size(400, 400);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {

   fill(255,255);
   rect(0,0,width,height);
  //background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display();
  }
} 


//Part of the Mover class is from the nature of code book.
class Mover {
  PVector location;
  PVector velocity;
  PVector acc;
  float topspeed;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    acc = PVector.sub(mouse, location);
    acc.normalize();
    acc.mult(0.2);

    velocity.add(acc);
    velocity.limit(5);
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(0);
    noSmooth();
    rect(location.x, location.y, 1, 1);
  }
}
