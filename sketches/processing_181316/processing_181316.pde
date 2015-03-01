
float opa;
color col;

void setup()
{
  size(600, 400);
  background(255);
  smooth();
}

void draw() 
{
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  col = color (int(random (255)), int(random (255)), int(random (255)));
   opa=mouseY*0.5;
}



// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 

void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  fill (col, opa);
  ellipse(x, y, speed, speed);
}


