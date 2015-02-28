
void setup()
{
  size(650, 450);
  background(250);
  smooth();
  noStroke();
}

void draw() 
{
    variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  fill(speed, 180,100,100 );
  ellipse(x, y, speed, speed);
}

