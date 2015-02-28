

void setup()
{
  size(450, 450);
  smooth();
  background(255);
}

void draw()
{
  int speed = abs(mouseX-pmouseX) + abs(mouseY-pmouseY);
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, speed, speed);
}

