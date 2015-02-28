
void setup()
{
  size(640, 360);
  background(102);
  smooth();
}

void draw() 
{
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  
  variableRect(mouseX, mouseY, pmouseX, pmouseY);
    variableEllipse(mouseX, mouseY, pmouseX, pmouseY);

}


// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 

void variableRect(int x, int y, int px, int py) 
{
  fill(0);
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  rect(x, y, speed, speed);
}

void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  line(x, y, speed, speed);
}

