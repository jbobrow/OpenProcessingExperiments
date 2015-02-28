
void setup() {
  size(800, 800);
  background(0);
  smooth();
  frameRate(10);
}

void draw() 
{
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}


void variableEllipse(int x, int y, int px, int py) 
{
  float speed = abs(x-px) + abs(y-py);
  noFill();
  stroke(speed);
  strokeWeight(3);
  rectMode(CENTER);
  rect(x, y, speed, speed);
}

