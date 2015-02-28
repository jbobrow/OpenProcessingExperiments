
/**
 * Patterns.
 * Playing with color, based on the Patterns program in the Topics/Drawing program 
 * 
 * Move the cursor over the image to draw with a software tool 
 * which responds to the speed of the mouse. 
 */
 
void setup() {
  size(640, 360);
  background(102);
  frameRate(30);
}

void draw() {
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
  var Red = (250/60)*second();
  var Blue = (250/60)*(second()/minute());
  var Green = (250/24)*(hour());
  stroke(Red-speed, Blue-speed, Green-speed );
  fill(Red,Blue,Green);
  ellipse(x, y, speed, speed);
}


