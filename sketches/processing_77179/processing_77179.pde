
PFont f;

void setup() {
  size(800, 600);
  background(75);
  f = createFont ("Verdana Bold", 16, true);

}

void draw() {
  
  textFont (f, 32);
  fill (255, 128, 128);
  text ("Kenny Rose Design", 440, 575);
  textFont (f, 16);
  fill (255, 128, 128);
  text ("created with Processing and Processing.js", 20, 20);
  
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}


// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  fill (255);
  stroke(speed);
  ellipse(x, y, speed, speed);
}


