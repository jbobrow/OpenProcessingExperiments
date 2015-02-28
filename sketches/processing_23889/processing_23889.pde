
// a vertical line
// the position of the line is controlled by a variable 
// create motion by changing the value in the variable on every frame
// automatically, rather than relying on the mouse

float x;

void setup() {
  size(300, 200);
  stroke(255);
  strokeWeight(2);
}

void draw() {
  background(64);
  
  // "move" x by 2 pixels
  // since we use x to control the line, the visual effect is that the line 
  // appears to be moving from left to right
  x += 2;
  
  // conditional statement:
  // if "x"'s value goes beyond the width sketch window, bring it back to 0 
  if ( x > width ) {
    x = 0;
  }
  
  line(x, 0, x, height);
}
