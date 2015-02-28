
int num = 300;
Dot[] dots = new Dot[num];
 
void setup(){
  size(800, 800);
  smooth();
  background(255);
  for (int i = 0; i < dots.length; i++) {
    dots[i] = new Dot();
  }
}
 
void draw(){
  for (int i = 0; i < dots.length; i++) {
    dots[i].update();
    dots[i].edge();
    dots[i].display();
  }
}
 
 
class Dot{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;   // to limit velocity
 
  Dot(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(10), random(10));
    topspeed = 5;
  }
 
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.2);
    acceleration = dir;
 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
 
  void edge() {
    if (location.x > width) {
      location.x = 0;
    }
    else if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    }
    else if (location.y < 0) {
      location.y = height;
    }
  }
 
  void display(){
    stroke(map(location.x, 0, width, 80, 255), map(location.y, 0, height, 70, 255), random(180,200));
    point(location.x, location.y);
  }
}
