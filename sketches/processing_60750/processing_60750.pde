
// bouncing ball PVectors
// processing.org/learning/pvector/
// 08.05.2012 10:00

class PVector {
  float x;
  float y;
  
  PVector(float x_, float y_){
    x = x_;
    y = y_;
  }
  void add(PVector v) {
    x = x + v.x;
    y = y + v.y;
  }
}
     
PVector location;
PVector velocity;

void setup() {
  size (200,200);
  smooth ();
  background (255);
  location = new PVector (100,100);
  velocity = new PVector (2.5,5);
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  // add current speed to the location
  location.add(velocity);
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }
  // display circle at x,y location
  stroke(0);
  fill(0);
  ellipse(location.x, location.y,16,16);
}
