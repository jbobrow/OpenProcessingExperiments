
void setup()
{

  size(400, 400);
  background(102);
  smooth();

}

void draw() 
{

  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

void variableEllipse(int x, int y, int px, int py) 

{

  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  fill(random(255), random(255), random(255));
  ellipse(x, y, speed, speed);

  if (mousePressed) {
    stroke(255);
  } else {
    stroke(0);
  }
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66); 
}

