
void setup()
{
  size(595, 560);
  background(77,206,203);
  fill(255,75);
  smooth();
}

void draw() 
{
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}


// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 

void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}
void keyPressed() {
  // if c or C key is pressed save this as beautiful.png
  if(key == 's' || key == 'S') {
    save ("finalpic16.jpg");
  } 
}




