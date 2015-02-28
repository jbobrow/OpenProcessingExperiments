
/**
 * Patterns. 
 * 
 * Move the cursor over the image to draw with a software tool 
 * which responds to the speed of the mouse. 
 */
 
void setup()
{
  size(640, 360);
  background(255);
  smooth();
  fill (133,131,247);
}

void draw() 
{
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  variablerect(mouseX, mouseY, pmouseX, pmouseY);
 
  }



// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 

void variablerect(int x, int y, int px, int py) 
{
  int speed = abs(x-px) - abs(y-py) + abs(x-px);
  stroke(speed);
  rect(x, y, speed, speed);
}

