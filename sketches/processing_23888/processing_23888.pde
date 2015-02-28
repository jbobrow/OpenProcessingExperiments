
// a vertical line
// the position of the line is controlled by a variable 
// rather than directly through the mouse position.

float x;

void setup() {
  size(300, 200);
  stroke(255);
  strokeWeight(2);
}

void draw() {
  background(64);
  
  // x = mouseX;  // direct version
  
  // more interesting:
  // add only a fraction of the difference between mouseX and x
  // on every frame
  // we can do this because we are using a variable 
  // which "remembers" the value we put in it from frame to frame.
  x += (mouseX - x) * 0.1;
  
  line(x, 0, x, height);
}
