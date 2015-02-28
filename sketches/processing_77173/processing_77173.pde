
class PVector {
  
  float x;
  float y;
  
  PVector (float x_, float y_) {
    
    x =x_;
    y = y_;
    
  }
  
  void add (PVector v) {
    
    x = x + v.x;
    y = y + v.y;
    
  }
  
}

PVector location;
PVector velocity;

PFont f;

void setup () {
  
  size (800, 600);
  smooth ();
  background (75);
  f = createFont ("Verdana Bold", 18, true);
  location = new PVector (100, 100);
  velocity = new PVector (2.5, 5);
  
}

void draw () {
  
  noStroke();
  fill (75, 10);
  rect(0, 0, width, height);
  textFont (f, 18);
  fill (255, 5);
  textAlign (LEFT);
  text ("created with Processing and Processing.js", 10, 20);
  textFont (f, 36);
  fill (255, 5);
  textAlign (RIGHT);
  text ("Kenny Rose Design", 790, 590);
  
  location.add(velocity);
  
  if ((location.x > width) || (location.x < 0)) {
    
    velocity.x = velocity.x * -1;
  }
  
  if ((location.y > height) || (location.y < 0)) {
    
    velocity.y = velocity.y * -1;
    
  }
  
  stroke (200, 50);
  strokeWeight (5);
  fill (255, 128, 128, 50);
  ellipse (location.x, location.y, 50, 50);
  
}
  




