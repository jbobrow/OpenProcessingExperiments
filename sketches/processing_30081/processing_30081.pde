
//EASING in one direction

float x;
float easing = 0.05;

void setup()
{
  size(800, 100);
  smooth();
  noStroke();
}
void draw()
{
  background(100);

  float targetX = mouseX;
  float remaining = (targetX - x);

  x+= remaining * easing;
  float y = constrain(mouseY, height/2, height/2);
  ellipse(x, y, 100, 100);
}

