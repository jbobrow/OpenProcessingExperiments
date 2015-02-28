
void setup()
{
  size(400, 400);
  background(120,255,200);
  smooth();
}

void draw() 
{
   variableRect(mouseX, mouseY, pmouseX, pmouseY);
}
void variableRect(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  strokeWeight (20);
  rect(x, y, speed, speed);
}

